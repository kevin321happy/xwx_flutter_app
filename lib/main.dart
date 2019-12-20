import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xwx_flutter_app/widget/clip_demo_page.dart';
import 'package:xwx_flutter_app/widget/controller_demo_page.dart';
import 'package:xwx_flutter_app/widget/data_demo_page.dart';
import 'package:xwx_flutter_app/widget/dialog_demo_page.dart';
import 'package:xwx_flutter_app/widget/drawer_demo_page.dart';
import 'package:xwx_flutter_app/widget/flow_label_demo_page.dart';
import 'package:xwx_flutter_app/widget/navigation_bar_demo_page.dart';
import 'package:xwx_flutter_app/widget/network_demo_page.dart';
import 'package:xwx_flutter_app/widget/scroll_listener_demo_page.dart';
import 'package:xwx_flutter_app/widget/swiper_demo_page.dart';
import 'package:xwx_flutter_app/widget/tab_layout_demo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        //配置国际化时间格式
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('zh','CH'),
          const Locale('en','US')
        ],

        title: "我的Flutter之路",
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: MyHomePage(title: "flutterStudy"),
  routes: routers,
    );}
}

//主页的Page
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

//页面的集合(列表数据)
const routerName = [
  "表单文本框",
  "圆角 例子",
  "滑动监听 例子",
  "标签布局",
  "底部导航栏",
  "顶部导航",
  "ControllerTab页面"
  "抽屉布局",
  "日期时间控件",
  "轮播图",
  "对话框",
  "网络请求",
  "简单上下刷新 例子",
  "简单上下刷新2 例子",
  "简单上下刷新3 例子",
  "绝对定位 例子",
  "弹出提示框 例子",
  "Tag 例子",
  "共享元素 例子",
  "状态栏颜色 例子",
  "键盘相关 例子",
  "动画 例子",
  "动画2 例子",
  "悬浮触摸控件 例子",
  "全局字体大小 例子",
  "富文本 例子",
  "viewpager 例子",
  "滑动停靠 例子"
];

//所有的页面

 Map<String,WidgetBuilder> routers={
   "widget/controller": (context) {
     return new ControllerDemoPage();
   },
   "widget/clip_demo": (context) {
     return new ClipDemoPage();
   },
   "widget/scroll_listener":(context){
     return new ScrollListenerDemoPage();
   },
   "widget/flow_label":(context){
     return new FlowLayoutDemoPage();
   },
   "widget/bottom_navigation":(context){
     return new NavigationBarDemoPage();
   },
   "widget/tab_layout":(context){
     return new TabLayoutDemoPage();
   },
   "widget/tab_layout":(context){
     return new ControlTabPage();
   },
   "widget/drawer_demo":(context){
     return new DrawerDemoPage();
   },
   "widget/data_demo":(context){
     return new DataPickDemoPage();
   },
   "widget/swiper_demo":(context){
     return new SwiperDemoPage();
   },
   "widget/dialog_demo":(context){
     return new DialogDemoPage();
   },
   "widget/network_demo":(context){
     return new NetWorkDemoPage();
   }
//   "widget/scroll_index":(context){
//     return new
//   }
 };

//页面
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(routeLists[index]);
                },
                child: new Card(
              child: new Container(
                decoration: BoxDecoration(color: Colors.white
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 60,
                child: Text('${routerName[index]}',style: TextStyle(fontSize: 20,color: Colors.black87),),
              ),
            ));
          },
          itemCount: routerName.length,
        ),
      ),
    );
  }
}
