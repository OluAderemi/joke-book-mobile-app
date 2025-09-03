import 'package:flutter/material.dart';
import '../Models/joke_model.dart';

class Page3 extends StatefulWidget {
  final List<Joke> jokes;
  final int initialIndex;

  Page3({required this.jokes, required this.initialIndex});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void nextJoke() {
    if (currentIndex < widget.jokes.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousJoke() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final joke = widget.jokes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Punchline'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            tooltip: 'Go Home',
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            if (details.primaryVelocity! < 0) {
              nextJoke(); // swipe left → next joke
            } else if (details.primaryVelocity! > 0) {
              previousJoke(); // swipe right → previous joke
            }
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Previous arrow
                if (currentIndex > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 36),
                    onPressed: previousJoke,
                    tooltip: 'Previous Joke',
                  )
                else
                  const SizedBox(width: 36), // placeholder

                // Joke and punchline with Back button below punchline
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        joke.setup,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        joke.punchline,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Back to List'),
                      ),
                    ],
                  ),
                ),

                // Next arrow
                if (currentIndex < widget.jokes.length - 1)
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 36),
                    onPressed: nextJoke,
                    tooltip: 'Next Joke',
                  )
                else
                  const SizedBox(width: 36), // placeholder
              ],
            ),
          ),
        ),
      ),
    );
  }
}
