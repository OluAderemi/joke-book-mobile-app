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
  String? selectedCategory;

  Future<void> fetchJokes(String category) async {
    setState(() {
      isLoading = true;
      selectedCategory = category;
    });

    try {
      final response = await http.get(
        Uri.parse('https://official-joke-api.appspot.com/jokes/$category/ten'),
      );

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
          const SnackBar(content: Text('Failed to load jokes')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void refreshJokes() {
    if (selectedCategory != null) {
      fetchJokes(selectedCategory!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Category'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            tooltip: 'Go Home',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshJokes,
            tooltip: 'Refresh Jokes',
          ),
        ],
      ),

      body: Column(
        children: [
          // Category buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
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
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(
                    joke.setup,
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
