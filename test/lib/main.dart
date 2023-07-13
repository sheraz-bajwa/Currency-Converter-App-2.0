import 'package:flutter/material.dart';
import 'package:money_converter/money_converter.dart';
import 'package:money_converter/Currency.dart';
import 'package:get/get.dart';
import 'package:test/Screens/Landing.dart';
import 'package:test/Screens/home.dart';
import 'package:test/SplashScreens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      //theme: const TextStyle(color: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
