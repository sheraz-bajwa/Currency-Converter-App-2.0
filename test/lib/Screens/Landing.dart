import 'package:flutter/material.dart';
import 'package:test/Screens/home.dart';
import 'package:fl_chart/fl_chart.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Expanded(
                child: LineChart(
                  LineChartData(
                    minX: 1,
                    minY: 0,
                    maxX: 7,
                    maxY: 10,
                    lineBarsData: lineChartBarData,
                  ),
                ),
              ),
            ),
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
                    Icon(
                      Icons.currency_bitcoin,
                      size: 40,
                      color: Colors.white,
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
                    Icon(
                      Icons.currency_bitcoin,
                      size: 40,
                      color: Colors.white,
                    ),
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

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(color: Colors.amber, isCurved: true, spots: [
    FlSpot(1, 8),
    FlSpot(3, 9.8),
    FlSpot(4, 9),
    FlSpot(5, 8),
    FlSpot(6, 8.6),
    FlSpot(7, 10)
  ])
];
