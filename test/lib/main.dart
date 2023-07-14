import 'package:flutter/material.dart';
import 'package:test/SplashScreens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      //theme: const TextStyle(color: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
