import 'package:flutter/material.dart';
import 'Screens/page1.dart';

void main() {
  runApp(JokeBookApp());
}

class JokeBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // Initial page
      home: Page1(),
    );
  }
}
