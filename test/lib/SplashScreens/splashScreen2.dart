import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/Landing.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Landing()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Center(
                    child: Lottie.asset('assets/three.json',
                        width: double.infinity))),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   'Currency Converter App',
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'All Currencies',
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}
