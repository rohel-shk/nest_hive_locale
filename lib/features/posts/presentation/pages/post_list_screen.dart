import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Lists')),
      body: Container(
        child: Center(
          child: Text('Post List display'),
        ),
      ),
    );
  }
}
