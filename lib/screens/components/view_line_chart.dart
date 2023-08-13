import 'package:d_pos/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewLineChart extends StatelessWidget {
  ViewLineChart({super.key});

  List<Color> gradientColors = [primaryColor, secondaryColor];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(
        appPadding,
        appPadding * 1.5,
        appPadding,
        appPadding,
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          // titlesData: FlTitlesData(
          //   show: true,
          //   bottomTitles:
          // ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 20,
          minY: 6,
          maxY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(4, 2),
                FlSpot(9, 4),
                FlSpot(12, 3),
                FlSpot(15, 5),
                FlSpot(18, 3),
                FlSpot(20, 4),
              ],
              isCurved: true,
              colors: [primaryColor],
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors.map((e) => e.withOpacity(0.3)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
