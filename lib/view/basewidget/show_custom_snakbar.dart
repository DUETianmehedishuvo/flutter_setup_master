
import 'package:flutter/material.dart';
import 'package:tutorial/util/custom_themes.dart';

void showCustomSnackBar(String message, BuildContext context, {bool isError = true}) {

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, textAlign: TextAlign.center, style: robotoRegular),
    backgroundColor: Colors.red,
  ));

}
