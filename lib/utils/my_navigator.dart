import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context,"/home");
  }
}