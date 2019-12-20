import 'package:flutter/material.dart';
import 'package:xwx_flutter_app/widget/controller_demo_page.dart';

import '../flow_label_demo_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePageState"),
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {
            print("点击了菜单");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("点击了搜索");
            },
          )
        ],
      ),
    );
  }
}
