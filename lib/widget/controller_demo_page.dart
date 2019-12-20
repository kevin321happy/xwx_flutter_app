import 'package:flutter/material.dart';
import 'package:xwx_flutter_app/main.dart';

class ControllerDemoPage extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();
  var userName=new TextEditingController(text: "请输入名字...");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "ControllerDemoPage",
      home: Scaffold(
        appBar: AppBar(
          title: Text("hhhhh"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                //单行文本框
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "请输入密码", border: OutlineInputBorder()),
                  controller: controller,
                ),

                SizedBox(height: 20),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "请输入内容", border: OutlineInputBorder()),
                  controller: controller,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: userName,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "请输入用户名..."
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
