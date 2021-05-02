
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/provider/theme_provider.dart';
import 'package:tutorial/util/color_resources.dart';
import 'package:tutorial/util/custom_themes.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final double width;
  final double height;

  CustomButton({this.onTap, @required this.buttonText, this.width, this.height = 45});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient: Provider.of<ThemeProvider>(context).darkTheme
                ? null
                : LinearGradient(colors: [
                    Colors.deepOrange.withOpacity(.8),
                    Colors.deepOrange.withOpacity(.9),
                    Colors.deepOrange.withOpacity(.8),
                  ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: height != 45 ? 20 : 16,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }

  MaterialButton buildFlatButton(BuildContext context, {double size = 45, double width}) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        height: size,
        width: MediaQuery.of(context).size.width * 0.60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient: Provider.of<ThemeProvider>(context).darkTheme
                ? null
                : LinearGradient(colors: [
                    Colors.deepOrange.withOpacity(.8),
                    Colors.deepOrange.withOpacity(.9),
                    Colors.deepOrange.withOpacity(.8),
                  ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: size != 45 ? 20 : 16,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
