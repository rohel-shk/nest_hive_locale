import 'package:flutter/material.dart';
import 'package:navigation_test/features/posts/presentation/pages/post_screen.dart';
import 'package:navigation_test/router.dart';

class PostHome extends StatefulWidget {
  const PostHome({Key? key}) : super(key: key);

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Home'),
      ),
      body: InkWell(
        onTap: (){
          postNav.currentState?.pushNamed(PostScreenNav.postListPath);
        },
        child: Container(
          child: Center(
            child: Text('This is post home'),
          ),
        ),
      ),
    );
  }
}
