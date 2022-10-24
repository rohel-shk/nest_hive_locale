import 'package:flutter/material.dart';
import 'package:navigation_test/main_screen.dart';

import 'features/posts/presentation/pages/post_screen.dart';
import 'features/users/presentation/pages/user_screen.dart';

GlobalKey<NavigatorState> mainNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> postNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> userNav=GlobalKey<NavigatorState>();

class Routers{
    static const mainScreen='/mainScreen';
    static const postScreen='/postScreen';
    static const userScreen='/userScreen';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case mainScreen:
        return MaterialPageRoute(builder: (_)=>MainScreen());
      case postScreen:
        return MaterialPageRoute(builder: (_)=>PostScreen());
      case userScreen:
        return MaterialPageRoute(builder: (_)=>UserScreen());
      default:
        return MaterialPageRoute(builder: (_)=>Container());
    }
  }
}