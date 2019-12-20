//网络请求的demo
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'PostDataDemoPage.dart';

class NetWorkDemoPage extends StatefulWidget {


  @override
  _NetWorkDemoPageState createState() => _NetWorkDemoPageState();
}

class _NetWorkDemoPageState extends State<NetWorkDemoPage> {
  Map map = {"username": "张三"};

  @override
  Widget build(BuildContext context) {
    //将 map转化为json
    print(json.encode(map));
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //get请求
            RaisedButton(
              color: Colors.blue,
              child: Text("get请求"),
              onPressed: () {
                _getData();
              },
            ),
            //post请求
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("post请求"),
              onPressed: () {
                _postData();
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("请求数据渲染页面"),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new PostDataDemoPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  //get请求获取数据
  void _getData() async{
    String _getUrl="https://api.sweeeart.com/conf/app/conf.json";
    var response = await http.get(_getUrl);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Fluttertoast.showToast(msg: "get请求成功");
      print("请求成功${jsonResponse}");
    } else {
      print("请求失败...");
    }
  }

  //post请求
  void _postData() async{
    //获取验证码
    String _postUrl="https://api.sweeeart.com/auth/send_verify_code";
    var response=await http.post(_postUrl,body: {'key':"86-15623374595",'mode':'1','purpose':'1'});
    if(response.statusCode==200){
      var result=json.decode(response.body);
      Fluttertoast.showToast(msg: "get请求成功");
      print("请求成功${result}");
    }else{
      Fluttertoast.showToast(msg: "get请求失败");
    }
  }
}
