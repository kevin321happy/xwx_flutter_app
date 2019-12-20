//抽屉布局
import 'package:flutter/material.dart';

class DrawerDemoPage extends StatefulWidget {
  @override
  _DrawerDemoPageState createState() => _DrawerDemoPageState();
}

class _DrawerDemoPageState extends State<DrawerDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("抽屉布局"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            //上面
            Row(
              children: <Widget>[
                Expanded(
                  child:UserAccountsDrawerHeader(
                    accountEmail: Text("527892060@qq.com"),
                    accountName: Text("小明同学"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage("https://www.itying.com/images/flutter/3.png"),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  )


//                  DrawerHeader(
//                    child: Text("你好啊"),
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                            image: new NetworkImage(
//                                "https://www.itying.com/images/flutter/2.png"),
//                            fit: BoxFit.cover
//                            //network("https://www.itying.com/images/flutter/2.png")
//                            )),
//                  ),
                )
              ],
            ),
            //下面
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("我的好友"),
              onTap: () {
                Navigator.of(context).pop();
                print("点击了我的好友");
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.search),
              ),
              title: Text("搜索"),
              onTap: () {
                Navigator.of(context).pop();
                print("点击了搜索");
              },
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("我是条目1"),
            ),
            ListTile(
              title: Text("我是条目2"),
            ),
            ListTile(
              title: Text("我是条目3"),
            ),
            ListTile(
              title: Text("我是条目4"),
            ),
            ListTile(
              title: Text("我是条目5"),
            )
          ],
        ),
      ),
    );
  }
}
