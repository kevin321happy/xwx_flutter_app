import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog{
  String title;
  String content;

  MyDialog({this.title,this.content});

  //定时器
  _showTimer(context){
    var timer;
    timer=Timer.periodic(Duration(milliseconds: 3000),(t) {
      Navigator.pop(context);
      t.cancel();
    });
  }
  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("${title}",style: TextStyle(fontSize: 30,color: Colors.redAccent),),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text("${content}")
              ],
            ),
          )
        ),
      ),
    );
  }


}