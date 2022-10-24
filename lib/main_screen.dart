import 'package:flutter/material.dart';
import 'package:navigation_test/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'features/posts/presentation/pages/post_screen.dart';
import 'features/users/presentation/pages/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> pages=[
    PostScreen(),
    UserScreen()
  ];
  int currentIndex=0;

  void onTap(int index){
    if(index==0){
      postNav.currentState?.pushReplacementNamed('/');
    }
    if(index==1){
      userNav.currentState?.pushNamed('/');
    }

    setState(() {
      currentIndex=index;
    });
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
if(message!=null) {
    print('${message.notification?.title}');
    userNav.currentState!.pushNamed(UserScreenNav.userListPath);
}   });

    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        // if (message.notification != null) {
        //   print(message.notification!.body);
        //   print("message.data11 ${message.data}");
        //   // LocalNotificationService.display(message);
        //
        // }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if(message!=null) {
          print('${message.notification!.title}');
          userNav.currentState!.pushNamed(UserScreenNav.userListPath);
        }
            // if (message.notification != null) {
        //   print(message.notification!.title);
        //   print(message.notification!.body);
        //   print("message.data22 ${message.data['_id']}");
        // }
      },
    );






  }

  @override
  Widget build(BuildContext context) {
     return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.post_add),label: 'Posts'),
              BottomNavigationBarItem(icon: Icon(Icons.post_add),label: 'Favs'),
              BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp),label: 'Users'),
            ],
          ),
        ),
      );

  }
}
