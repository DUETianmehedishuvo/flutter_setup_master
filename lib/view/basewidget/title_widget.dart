import 'package:flutter/material.dart';

Widget titleWidget(String key, String value,{double left=16,double right=0,double top=8,double bottom=4}) {
  return value!=null?Container(
    padding: EdgeInsets.only(left: left, top: top, bottom: bottom,right: right),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 2,child: Text(key ?? '', style: TextStyle(fontSize: 18, color: Colors.blueGrey))),
        Expanded(flex: 3, child: Text(value ?? '', style: TextStyle(fontSize: 19, color: Colors.black)))
      ],
    ),
  ):SizedBox.shrink();
}