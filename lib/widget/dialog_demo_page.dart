//对话框
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:xwx_flutter_app/widget/components/MyDialog.dart';

class DialogDemoPage extends StatefulWidget {
  @override
  _DialogDemoPageState createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends State<DialogDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("对话框"),
        ),
        body: Center(
          child: Column(
            //主轴,控制垂直方向
            mainAxisAlignment: MainAxisAlignment.center,
            //水平方向
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text("提示弹窗"),
                onPressed: _alertDialog,
                //onPressed: ,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text("简单弹窗"),
                onPressed: _simpleDialog,
                //onPressed: ,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text("底部弹窗"),
                onPressed: _bottomDialog,
                //onPressed: ,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text("Toast弹窗"),
                onPressed: _showToast,
                //onPressed: ,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text("自定义弹窗"),
                onPressed: _showCustomDialog,
                //onPressed: ,
              ),
            ],
          ),
        ));
  }

  //普通的提示弹窗
  _alertDialog() {
    print("弹出弹窗吧.....");
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("取消关注就不能查看对方动态"),
            actions: <Widget>[
              RaisedButton(
                child: Text("取消"),
                onPressed: () {
                  print("点击了取消");
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text("确定"),
                onPressed: () {
                  print("点击了确定");
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  //简单的弹窗
  void _simpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("简单的列表弹窗"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("选项A"),
                onPressed: () {
                  print("点击了选项A");
                  Navigator.pop(context);
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选项B"),
                onPressed: () {
                  print("点击了选项B");
                  Navigator.pop(context);
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选项C"),
                onPressed: () {
                  print("点击了选项C");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //底部弹窗
  void _bottomDialog() async {
   var result=await showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 250,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("分享到微信"),
              leading: Icon(Icons.account_circle),
              onTap: (){

                Navigator.pop(context,"分享到微信");
              },
            ),
            Divider(),
            ListTile(
              title: Text("分享到QQ"),
              leading: Icon(Icons.account_circle),
              onTap: (){
                Navigator.pop(context,"分享到QQ");
              },
            ),
            Divider(),
            ListTile(
              title: Text("分享到微博"),
              leading: Icon(Icons.account_circle),
              onTap: (){
                Navigator.pop(context,"分享到微博");
              },
            )
          ],
        ),
      );
    });
   print("$result");
  }

  //toast
  void _showToast() {
    Fluttertoast.showToast(
        msg: "提示信息",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  //自定义谈窗
  void _showCustomDialog() {
    showDialog(context: context,builder: (context){
      return MyDialog(title:"沙河口",content: "asdkjfklajdlfajkldjflkajfdlakjfajhflkdajflka",);
    });

  }
}
