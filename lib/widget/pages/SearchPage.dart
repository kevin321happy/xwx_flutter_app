import 'package:flutter/material.dart';
//搜索页面

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text("一个闹钟十块钱"),
        leading: Icon(Icons.access_alarm),),
        ListTile(title: Text("一个闹钟十块钱"),
          leading: Icon(Icons.home),),
        ListTile(title: Text("一个闹钟十块钱"),
          leading: Icon(Icons.print),),
        ListTile(title: Text("一个闹钟十块钱"),
          leading: Icon(Icons.airplanemode_active),)
        , ListTile(title: Text("一个闹钟十块钱"),
          leading: Icon(Icons.add_a_photo),)
      ],
    );
  }
}


