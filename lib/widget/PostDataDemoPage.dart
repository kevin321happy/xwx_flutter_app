import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PostDataDemoPage extends StatefulWidget {
  @override
  _PostDataDemoPageState createState() => _PostDataDemoPageState();
}

class _PostDataDemoPageState extends State<PostDataDemoPage> {
  List _list = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("列表数据"),
        ),
        body: _list.length == 0
            ? Center(
          child: Text("数据加载中...."),
        )
            : ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title:Text("${this._list[index]["title"]}"),
            );
          },
          itemCount: _list.length,
        ));
  }

//获取网络数据
  void _getData() async {
    var apiUrl = "http://a.itying.com/api/productlist";
    var result = await http.get(apiUrl);
    if (result.statusCode == 200) {
      print(result.body);
      setState(() {
        this._list=convert.json.decode(result.body)["result"];
      });
    } else {
      print("失败${result.statusCode}");
    }
  }
}
