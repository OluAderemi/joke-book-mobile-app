import 'package:flutter/material.dart';
import 'Models/joke_model.dart';
import 'Screens/page1.dart';
import 'Screens/page2.dart';
import 'Screens/page3.dart';

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
      // Optional: Define named routes
      routes: {
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(joke: Joke(setup: '', punchline: '', type: '', id: 0)), // placeholder
      },
    );
  }
}
