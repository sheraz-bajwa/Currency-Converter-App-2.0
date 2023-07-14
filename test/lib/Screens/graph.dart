import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 300,
              width: double.infinity,
              //decoration: BoxDecoration(color: Colors.amber),
              child: Expanded(
                child: LineChart(
                  LineChartData(
                    backgroundColor: Colors.black26,
                    minX: 1,
                    minY: 0,
                    maxX: 7,
                    maxY: 7,
                    lineBarsData: lineChartBarData,
                  ),
                ),
              ),
            );
  }
}

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(color: Colors.amber, isCurved: true, spots: [
    const FlSpot(1, 0),
    const FlSpot(2, 2),
    const FlSpot(3, 3),
    const FlSpot(4, 2),
    const FlSpot(6, 6)
  ])
];
