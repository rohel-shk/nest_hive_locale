import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/user.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  TextEditingController _userController=TextEditingController();

  void addUser(User user){
    Hive.box('users').add(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Container(
        padding:EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: _userController,
                ),
                ElevatedButton(onPressed: (){
                  addUser(User(name: _userController.text));
                  Navigator.pop(context);
                }, child: Text('Add todo'))
              ]
          )
      ),
    );  }
}
