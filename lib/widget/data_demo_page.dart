//日期时间选择控件
import 'package:flutter/material.dart';

//import 'dat';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

//日期选择器
class DataPickDemoPage extends StatefulWidget {
  @override
  _DataPickDemoPageState createState() => _DataPickDemoPageState();
}

class _DataPickDemoPageState extends State<DataPickDemoPage> {

  var _nowDate=DateTime.now();
  var _nowTime=TimeOfDay(hour: 12,minute: 20);
  var _nowPickTime=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期时间控件"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  Text("${formatDate(_nowDate, ['yyyy','年',mm,'月',dd])}"),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () {
                _showDatePicker();
//                print("显示日期时间控件.....");
                print(TimeOfDay.now());
              },
            ),
            SizedBox(width: 10),
            InkWell(
              child: Row(
                children: <Widget>[Text("${_nowTime.format(context)}"), Icon(Icons.arrow_drop_down)],
              ),
              onTap: () {
                _showTimePicker();
                //print("显示时间控件.....");
                var time = DateTime.now();
                print(DateTime.now());
                // 2019-12-18 17:47:50.987855
                //将时间戳转化为时间格式
                //时间格式转时间戳
                print(time.millisecondsSinceEpoch);
                //  时间戳转时间格式  1576662645111
                print(DateTime.fromMicrosecondsSinceEpoch(1576662645111));
              },
            ),
            SizedBox(width: 10),
           //时间滚动控件选择时间
            InkWell(
              child: Row(
                children: <Widget>[Text("${formatDate(_nowPickTime, ['yyyy','年',mm,'月',dd,' ',HH,':',nn])}"), Icon(Icons.arrow_drop_down)],
              ),
              onTap: () {
                _showDateWheelPicker();
              },
            ),
          ],
        ),
      ),
    );
  }

//显示日期控件
  void _showDatePicker() async {
    var result = await showDatePicker(
        context: context,
        initialDate:_nowDate,
        firstDate: DateTime(1992),
        locale: prefix0.Locale('zh'),
        lastDate: DateTime(2020));

    setState(() {
      this._nowDate=result;
    });
    print(result);
  }
//显示时间
  void _showTimePicker() async {
    var result=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      this._nowTime=result;
    });
  }

  //显示时间的滚轮
  void _showDateWheelPicker() {

//    DatePicker.showDatePicker(
//        BuildContext context,
//        DateTime minDateTime,
//        DateTime maxDateTime,
//        DateTime initialDateTime,
//        String dateFormat,
//        DateTimePickerLocale locale: DATETIME_PICKER_LOCALE_DEFAULT,
//        DateTimePickerMode pickerMode: DateTimePickerMode.date,
//        DateTimePickerTheme pickerTheme: DatePickerTheme.Default,
//        DateVoidCallback onCancel,
//        DateVoidCallback onClose,
//        DateValueCallback onChange,
//        DateValueCallback onConfirm,
//    });
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确定', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
      ),
      minDateTime: DateTime.parse("1980-01-10"),
      maxDateTime: DateTime.parse("2020-01-10"),
      initialDateTime:_nowPickTime ,
      //显示年月日
   //   dateFormat: "yyyy-MMMM-dd",
      //显示年月日时分秒
      dateFormat: 'yyyy年M月d日    EEE,H时:m分',
      pickerMode: DateTimePickerMode.datetime,

      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _nowPickTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _nowPickTime = dateTime;
        });
      },
    );
    //print("弹出滚轮。。。");
  }
}
