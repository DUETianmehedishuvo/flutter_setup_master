import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/util/custom_themes.dart';
import 'package:tutorial/util/dimensions.dart';
import 'package:tutorial/util/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _route();
  }

  void _route() {
    Timer(Duration(seconds: 2), () {
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

    return Scaffold(
      key: _globalKey,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Container(child: Image.asset(Images.app_logo, width: 130, height: 130))),
            Text(getTranslated('bapza_mis', context), style: robotoBold.copyWith(fontSize: 25, color: Colors.blueGrey)),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
