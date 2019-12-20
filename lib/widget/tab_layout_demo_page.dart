//TabLayout导航
import 'package:flutter/material.dart';
class TabLayoutDemoPage extends StatefulWidget {
  @override
  _TabLayoutDemoPageState createState() => _TabLayoutDemoPageState();
}

class _TabLayoutDemoPageState extends State<TabLayoutDemoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            //title: Text("tabLayout页面"),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    isScrollable: true,
                    unselectedLabelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(text: "热门"),
                      Tab(text: "推荐"),
                      Tab(text: "关注"),
                      Tab(text: "附近")
                    ],
                  ),
                )
              ],
            ),
          //  bottom:
          ),
          //TabBar的子元素数量和length长度一样
          body: TabBarView(
            children: <Widget>[
              ListView(children: <Widget>[
                ListTile(title: Text("第一个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第一个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第一个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第一个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第一个页面"),leading: Icon(Icons.four_k),)
              ],),
              Center(
                child: RaisedButton(
                  child: Text("跳转自定义的TabControl"),
                  onPressed: (){
                    //跳转到TabControl页面
//                    Navigator.of(context).push(context, new MaterialPageRoute(
//                      builder: TabLayoutDemoPage()
//                    ));
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new ControlTabPage(),
                  ));
                  },
                ),
              ),
              ListView(children: <Widget>[
                ListTile(title: Text("第3个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第3个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第3个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第3个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第3个页面"),leading: Icon(Icons.four_k),)
              ],),
              ListView(children: <Widget>[
                ListTile(title: Text("第4个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第4个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第4个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第4个页面"),leading: Icon(Icons.four_k),),
                ListTile(title: Text("第4个页面"),leading: Icon(Icons.four_k),)
              ],),
            ],
          ),
        ),
      ),
    );
  }
}

//ControlTabPage
class ControlTabPage extends StatefulWidget {
  @override
  _ControlTabPageState createState() => _ControlTabPageState();
}

//with表示继承关键字
class _ControlTabPageState extends State<ControlTabPage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  void initState() {
    super.initState();
    _tabController=new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TabControllerPage"),
      bottom: TabBar(
        controller: this._tabController,
        tabs: <Widget>[
          Tab(text: "热销"),
          Tab(text: "平价"),
          Tab(text: "打折")
        ],
      ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(child: Text("热销"),),
          Center(child: Text("平价"),),
          Center(child: Text("打折"),)
        ],
      ),
    );
  }
}


