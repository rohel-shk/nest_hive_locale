import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/user.dart';

class UpdateUserScreen extends StatefulWidget {

  String? name;
  int index;
  UpdateUserScreen({Key? key,this.name,required this.index}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {

  TextEditingController _userController=TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userController.text=widget.name!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Todo')),
      body: Container(
        padding: EdgeInsets.all(10.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: _userController,
                ),
                ElevatedButton(onPressed: (){
                  Hive.box('users').putAt(widget.index, User(name: _userController.text));
                  Navigator.pop(context);
                }, child: Text('Update todo'))
              ]
          )
      ),
    );  }
}
