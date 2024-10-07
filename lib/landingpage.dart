import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title, body: $body}';
  }
}
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {
  List<Post> posts = [];
  bool isLoading = false;

   Future<void> fetchData() async {
    try {
      // Simulate network request
      await Future.delayed(Duration(seconds: 2));
      // Replace with actual data fetching logic
      List<Post> fetchedPosts = [
        Post(userId: 1, id: 1, title: 'Post 1', body: 'This is the body of post 1'),
        Post(userId: 2, id: 2, title: 'Post 2', body: 'This is the body of post 2'),
      ];
      setState(() {
        posts = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      backgroundColor: const Color(0xFF7E01FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to the App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/play.png')),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(child: posts.isEmpty
                    ? const Center(
                        child: Text('No data found',
                            style: TextStyle(color: Colors.white)))
                    : ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(posts[index].title,
                                style: const TextStyle(color: Colors.white)),
                            subtitle: Text(posts[index].body,
                                style: const TextStyle(color: Colors.white)),
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}