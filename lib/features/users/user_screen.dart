import 'package:flutter/material.dart';
import 'package:navigation_test/features/users/update_user_screen.dart';
import 'package:navigation_test/features/users/user_home_screen.dart';
import 'package:navigation_test/features/users/add_user_screen.dart';
import 'package:navigation_test/features/users/user_list_screen.dart';
import 'package:navigation_test/router.dart';


class UserScreenNav{
  static const userListPath='/userScreen/userListScreen';
  static const addUserPath='/userScreen/addUserScreen';
  static const updateUserPath='/userScreen/updateUserScreen';

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
          case UserScreenNav.addUserPath:
            page=AddUserScreen();
            break;
          case UserScreenNav.updateUserPath:
          final args=settings.arguments as Map;
            page=UpdateUserScreen(
              name: args['name'],
              index: args['index'],
            );
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder: (_,__,___)=>page);
      },
    );
  }
}
