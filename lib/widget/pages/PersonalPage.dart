
//个人界面
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我是个人界面",style: TextStyle(
        color: Colors.pinkAccent,
        fontSize: 40
      ),),
    );
  }
}
