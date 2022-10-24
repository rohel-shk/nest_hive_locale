import 'package:flutter/material.dart';
import 'package:navigation_test/features/users/presentation/pages/user_home_screen.dart';
import 'package:navigation_test/features/users/presentation/pages/user_detail_screen.dart';
import 'package:navigation_test/features/users/presentation/pages/user_list_screen.dart';
import 'package:navigation_test/router.dart';


class UserScreenNav{
  static const userListPath='/userScreen/userListScreen';
  static const userDetailPath='/userScreen/userDetailScreen';
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: userNav,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings){
        Widget page;
        switch(settings.name){
          case '/':
            page=UserHome();
            break;
          case UserScreenNav.userListPath:
            page=UserListScreen();
            break;
          case UserScreenNav.userDetailPath:
            page=UserDetailScreen();
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder: (_,__,___)=>page);
      },
    );
  }
}
