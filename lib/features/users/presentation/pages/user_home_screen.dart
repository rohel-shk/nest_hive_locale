import 'package:flutter/material.dart';
import 'package:navigation_test/features/users/presentation/pages/user_screen.dart';

import 'package:navigation_test/router.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home'),
      ),
      body: Container(
        child: Center(
          child: InkWell(
              onTap: (){
                userNav.currentState?.pushNamed(UserScreenNav.userListPath);
              },
              child: Text('this is user home')),
        ),
      ),
    );
  }
}
