import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:navigation_test/common/widget/nav_item.dart';
import 'package:navigation_test/router.dart';
import 'package:navigation_test/features/users/user_screen.dart';

import 'model/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          userNav.currentState?.pushNamed(UserScreenNav.addUserPath);
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: Hive.openBox('users'),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Text('${snapshot.error.toString()}');
            }
            else{
              return WatchBoxBuilder(
                box: Hive.box('users'),
                builder: (context,userbox){
                  return userbox.isNotEmpty?
                   ListView.builder(
                      itemCount: userbox.length,
                      itemBuilder: (context,index){
                        User user=userbox.getAt(index) as User;
                        return ListTile(
                          onTap: (){
                            userNav.currentState?.pushNamed(UserScreenNav.updateUserPath,arguments: {'name':user.name,'index':index});
                          },
                          trailing: IconButton(onPressed: (){
                            userbox.deleteAt(index);
                          },
                          icon: Icon(Icons.delete),
                          ),
                          title: Text('${user.name}'),
                        );

                      }): Center(child: Text('There are no users'),);

                },
              );
            }
          }
          else{
            return Scaffold();
          }

        },
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
