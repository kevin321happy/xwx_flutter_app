//轮播图
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDemoPage extends StatefulWidget {
  @override
  _SwiperDemoPageState createState() => _SwiperDemoPageState();
}

class _SwiperDemoPageState extends State<SwiperDemoPage> {
  List<Map> imagesList = [
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"},
    {"url": "https://www.itying.com/images/flutter/4.png"},
    {"url": "https://www.itying.com/images/flutter/5.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("轮播图"),
        ),
        body: Column(
          children: <Widget>[
            Container(
                //height: 150,
                child: AspectRatio(
              aspectRatio: 20 / 6,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    imagesList[index]["url"],
                    fit: BoxFit.fill,
                  );
                },
                //自动轮播
                loop: true,
                //无限循环
                autoplay: true,
                itemCount: imagesList.length,
                //分页指示器
                pagination: new SwiperPagination(),
                //左右控制器
                //control: new SwiperControl(),
              ),
            )),
            Text(
              "这是普通轮播图",
              style: TextStyle(fontSize: 20, color: Colors.lightBlue),
            ),
            Container(
              height: 200,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    imagesList[index]["url"],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imagesList.length,
                itemWidth: 300.0,
                layout: SwiperLayout.STACK,
                //自动轮播
                loop: true,
                //无限循环
                autoplay: true,
              ),
            ),
            Text(
              "卡片",
              style: TextStyle(fontSize: 20, color: Colors.lightBlue),
            ),
            Container(
              height: 300,
                child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(imagesList[index]["url"],
                    fit: BoxFit.fill);
              },
              itemCount: imagesList.length,
              itemWidth: 200,
              itemHeight: 250,
              layout: SwiperLayout.TINDER,
            ))
//            Text(
//              "探探",
//              style: TextStyle(fontSize: 20, color: Colors.lightBlue),
//            ),
          ],
        ));
  }
}
