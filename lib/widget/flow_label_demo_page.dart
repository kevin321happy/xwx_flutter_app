import 'package:flutter/material.dart';

class FlowLayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("流式标签布局"),
        ),
        body: MyHomePage()
//          Container(
//            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
//            color: Colors.deepOrange,
//            height: 700,
//            child:  Wrap(
//              runSpacing: 10.0,
//              spacing: 10.0,
//             runAlignment: WrapAlignment.center,
//              children: <Widget>[
//                MyButton("老坛酸菜"),
//                MyButton("牛肉"),
//                MyButton("猪肉打算"),
//                MyButton("博客园"),
//                MyButton("小青铜"),
//                MyButton("最强王者"),
//                MyButton("英勇黄金"),
//                MyButton("不屈白银"),
//                MyButton("最菜青铜"),
//                MyButton("无敌黑呵呵呵铁"),
//              ],
//            ),
//          )
        );
  }
}

//有状态组件,可以动态改变页面的数据
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nowCount = 0;
  List list = new List();
  @override
  Widget build(BuildContext context) {
   return ListView(children: <Widget>[
      Column(
        children: this.list.map((value){
          return ListTile(
            title: Text(value),
          );
        }).toList(),
      ),
      SizedBox(height:10.0),
      RaisedButton(
        child: Text("点击新增内容"),
        onPressed: (){
          setState(() {
            list.add("我是新增的数据01");
            list.add("我是新增的数据02");
          });
        },
      )
    ]);

    //这里返回自定义组件
//    return Container(
//      alignment: Alignment.center,
//      child: Column(
//       children: <Widget>[
//         Text("当前的count:${nowCount}")
//         ,SizedBox(height:20.0),
//         RaisedButton(
//           child: Text("点击改变文本显示"),
//           onPressed: (){
//             //改变数据重新渲染到页面
//             setState(() {
//               nowCount++;
//             });
//           },
//         )
//       ],
//      ),
//    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      color: Colors.greenAccent,
      textColor: Theme.of(context).accentColor,
      // textTheme: Theme.of(context).accentTextTheme,
//          shape: new BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: new BorderSide(
//            style: BorderStyle.solid,
//          )),
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            style: BorderStyle.solid, color: Colors.lightBlue, width: 1.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontSize: 15.0),
      ),
    );
  }
}
