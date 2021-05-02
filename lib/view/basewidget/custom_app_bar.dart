import 'package:flutter/material.dart';
import 'package:tutorial/util/custom_themes.dart';
import 'package:tutorial/util/dimensions.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  final GlobalKey<ScaffoldState> drawerKey;
  final bool isResponsive;

  CustomAppBar({@required this.title, this.isBackButtonExist = true, this.onBackPressed, this.drawerKey, this.isResponsive});

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style:
              robotoRegular.copyWith(fontSize: isResponsive ? 20 : Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).textTheme.bodyText1.color)),
      //centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).textTheme.bodyText1.color,
              onPressed: () async {
                Navigator.pop(context);
              })
          : SizedBox(),
      backgroundColor: Theme.of(context).accentColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
