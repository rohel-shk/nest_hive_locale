import 'package:flutter/material.dart';
import 'package:navigation_test/features/posts/post_detail_screen.dart';
import 'package:navigation_test/features/posts/post_home_screen.dart';
import 'package:navigation_test/features/posts/post_list_screen.dart';
import 'package:navigation_test/router.dart';


class PostScreenNav{
  static const postListPath='/postScreen/postListScreen';
  static const postDetailPath='/postScreen/postDetailScreen';
}

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: postNav,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings){
        Widget page;
        switch(settings.name){
          case '/':
            page=PostHome();
            break;
          case PostScreenNav.postListPath:
            page=PostListScreen();
            break;
          case PostScreenNav.postDetailPath:
            page=PostDetailScreen();
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder:(_,__,___)=> page);
      },
    );
  }
}
