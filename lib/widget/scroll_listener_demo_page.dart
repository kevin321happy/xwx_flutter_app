import 'package:flutter/material.dart';

import 'package:xwx_flutter_app/main.dart';

//滑动监听
class ScrollListenerDemoPage extends StatefulWidget {
  @override
  _ScrollListenerDemoPageState createState() => _ScrollListenerDemoPageState();
}

class _ScrollListenerDemoPageState extends State<ScrollListenerDemoPage> {
  final ScrollController _scrollControllers = new ScrollController();

  bool isEnd = false;

  double offset = 0;

  String notify = "哈哈哈哈";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollControllers.addListener(() {
      setState(() {
        offset = _scrollControllers.offset;
        isEnd = _scrollControllers.position.pixels ==
            _scrollControllers.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollListenerDemoPage"),
      ),
      body: Container(
        child: NotificationListener(
          onNotification: (notification) {
            String notify;
            if (notification is ScrollEndNotification) {
              notify = "ScrollEnd";
            } else if (notification is ScrollStartNotification) {
              notify = "ScrollStart";
            } else if (notification is UserScrollNotification) {
              notify = "ScrollUser";
            } else if (notification is ScrollUpdateNotification) {
              notify = "ScrollUpdata";
            }
            setState(() {
              this.notify = notify;
            });
            return false;
          },
          child: ListView.builder(
            controller: _scrollControllers,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(5.0),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text("Item${index}"),
                ),
              );
            },
            itemCount: 200,
          ),
        ),
      ),
      //滑动到底部到视图
      persistentFooterButtons: <Widget>[
        new FlatButton(
          onPressed: () {
            _scrollControllers.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.bounceInOut);
          },
          child: new Text("position: ${offset.floor()}"),
        ),
        new Container(width: 0.3, height: 30.0),
        new FlatButton(
          onPressed: () {},
          child: new Text("${notify} ..."),
        ),
        new Visibility(
          visible: isEnd,
          child: new FlatButton(
            onPressed: () {},
            child: new Text("到达底部"),
          ),
        )
      ],
    );
  }
}
