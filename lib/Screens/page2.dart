import 'package:flutter/material.dart';
import 'dart:convert';
import '../Models/joke_model.dart';
import 'page3.dart';
import 'package:http/http.dart' as http;


class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final List<String> categories = ['general', 'knock-knock', 'programming'];
  List<Joke> jokes = [];
  bool isLoading = false;

  Future<void> fetchJokes(String category) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
        Uri.parse('https://official-joke-api.appspot.com/jokes/$category/ten'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        jokes = data.map((j) => Joke.fromJson(j)).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load jokes')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Category'),
      ),
      body: Column(
        children: [
          // Category buttons
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories.map((category) {
                return ElevatedButton(
                  onPressed: () => fetchJokes(category),
                  child: Text(category.toUpperCase()),
                );
              }).toList(),
            ),
          ),
          // Joke list
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(joke.setup),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page3(joke: joke),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
