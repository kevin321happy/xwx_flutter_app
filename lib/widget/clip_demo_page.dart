import 'package:flutter/material.dart';
import 'package:xwx_flutter_app/main.dart';

class  ClipDemoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ClipDemoPage"),),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20.0),
        //垂直布局
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" BoxDecoration 圆角"),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(" BoxDecoration 圆角2"),
            //第二个圆角
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset("static/gsy_cat.png",
                fit: BoxFit.cover,
                width: 100,
              height: 100,),
            )
          ],

        ),
      ),
    );
  }
}


