
import 'package:flutter/material.dart';
import 'package:xwx_flutter_app/widget/pages/HomePage.dart';
import 'package:xwx_flutter_app/widget/pages/PersonalPage.dart';
import 'package:xwx_flutter_app/widget/pages/SearchPage.dart';

//底部导航栏组件
class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;

  var _pageList=[HomePage(),SearchPage(),PersonalPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text("导航栏的Demo")),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(12.0),
      //  margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
//          color: this._currentIndex==1?Colors.pink:Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor: this._currentIndex==1?Colors.pink:Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        fixedColor: Colors.pinkAccent,
        //配置可以显示多个按钮
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        //底部点击触发的方法
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
          //  currentIndex: index,
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人"))
//          , BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
//          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
//          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人"))
        ],
      ),
    );
  }
}
