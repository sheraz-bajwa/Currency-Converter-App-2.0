import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:test/SplashScreens/splashScreen2.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Splash2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Center(
                  child:
                      Lottie.asset('assets/two.json', width: double.infinity))),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: const Column(
              children: [
                Text(
                  'Currency Converter App',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  'All Currencies',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
