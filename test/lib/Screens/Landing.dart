import 'package:flutter/material.dart';
import 'package:test/Screens/graph.dart';
import 'package:test/Screens/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test/Screens/new.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Currency Exchange',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Graph(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset:
                          Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 61, 61, 61),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/exchange.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      'Any To Any',
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    )
                  ],
                ),
                width: double.infinity,
                height: 80,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home1()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset:
                          Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 61, 61, 61),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/dollar.png'),
                    Text(
                      'USD To Any',
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    )
                  ],
                ),
                width: double.infinity,
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
