import 'package:flutter/material.dart';
import '../Models/joke_model.dart';

class Page3 extends StatelessWidget {
  final Joke joke;

  const Page3({Key? key, required this.joke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Punchline'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                joke.setup,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                joke.punchline,
                style: TextStyle(fontSize: 28, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Back to joke list
                },
                child: Text('Back to List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
