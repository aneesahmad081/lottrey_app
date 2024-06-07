import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LotteryApp());
}

class LotteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lottery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Lottery App'),
        ),
        body: LotteryHomePage(),
      ),
    );
  }
}

class LotteryHomePage extends StatefulWidget {
  @override
  _LotteryHomePageState createState() => _LotteryHomePageState();
}

class _LotteryHomePageState extends State<LotteryHomePage> {
  List<int> _lotteryNumbers = [];
  int _winningNumber = 14; // Example winning number

  void _generateNumbers() {
    setState(() {
      _lotteryNumbers = _generateRandomNumbers();
    });

    // Check if any of the generated numbers match the winning number
    if (_lotteryNumbers.contains(_winningNumber)) {
      _showWinnerDialog();
    }
  }

  List<int> _generateRandomNumbers() {
    Random random = Random();
    List<int> numbers = [];

    // Generate 6 unique random numbers between 1 and 20 for testing
    while (numbers.length < 1) {
      int randomNumber = random.nextInt(20) + 1;
      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }

    // Sort the numbers in ascending order
    numbers.sort();

    return numbers;
  }

  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('🎉 Congratulations! 🎉',
          style: TextStyle(fontSize: 25,color: Colors.red),),
          content: Text('You have won the lottery🥳',
          style: TextStyle(fontSize: 23,color: Colors.red),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Lottery Wining Numbers is 14',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 20),
          _lotteryNumbers.isEmpty
              ? Text(
            'Tap the button below to generate numbers',
            style: TextStyle(fontSize: 18),
          )
              : Column(
            children: _lotteryNumbers.map((number) {
              return Text(
                number.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generateNumbers,
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.cyan,
           ),
           child: Text('Tap the Button',
            style: TextStyle(color: Colors.black),),


          ),
        ],
      ),
    );
  }
}
