import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ael/helper/network_info.dart';
import 'package:ecommerce_ael/provider/auth_provider.dart';
import 'package:ecommerce_ael/provider/splash_provider.dart';
import 'package:ecommerce_ael/provider/theme_provider.dart';
import 'package:ecommerce_ael/utill/color_resources.dart';
import 'package:ecommerce_ael/utill/images.dart';
import 'package:ecommerce_ael/view/basewidget/no_internet_screen.dart';
import 'package:ecommerce_ael/view/screen/onboarding/onboarding_screen.dart';
import 'package:ecommerce_ael/view/screen/splash/widget/splash_painter.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    NetworkInfo.checkConnectivity(context);

    if (Platform.isIOS) {
      _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }else {
      _saveDeviceToken();
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
    //Provider.of<CartProvider>(context, listen: false).getCartData();
    Provider.of<SplashProvider>(context, listen: false).initConfig().then((bool isSuccess) {
      if(isSuccess) {
        Timer(Duration(seconds: 1), () {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreen()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>
                    OnBoardingScreen(indicatorColor: ColorResources.GREY, selectedIndicatorColor: ColorResources.COLOR_PRIMARY)));
          }
        });
      }else {
        Provider.of<SplashProvider>(context, listen: false).initConfig().then((bool isSuccess) {
          if(isSuccess) {
            if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreen()));
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      OnBoardingScreen(indicatorColor: ColorResources.GREY, selectedIndicatorColor: ColorResources.COLOR_PRIMARY)));
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<SplashProvider>(context).hasConnection ? Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Provider.of<ThemeProvider>(context).darkTheme ? Colors.black : ColorResources.getPrimary(context),
            child: CustomPaint(
              painter: SplashPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Image.asset(Images.splash_logo, height: 250.0, fit: BoxFit.scaleDown, width: 250.0),
              ],
            ),
          ),
        ],
      ) : NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
    );
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    if (fcmToken != null) {
      print('--------Token---------- '+fcmToken);
    }
  }
}
