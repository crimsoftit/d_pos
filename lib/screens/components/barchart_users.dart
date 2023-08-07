import 'package:d_pos/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartUsers extends StatelessWidget {
  const BarChartUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border.all(width: 0),
        ),
        groupsSpace: 15,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(
              color: lightTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            margin: appPadding,
            getTitles: (double value) {
              if (value == 2) {
                return '';
              } else {
                return '';
              }
            },
          ),
        ),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: 10,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
              y: 3,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
              y: 12,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
              y: 5,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
              y: 8,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
              y: 20,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
              y: 13,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
              y: 15,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
              y: 2,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
              y: 1,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 11, barRods: [
            BarChartRodData(
              y: 7,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 12, barRods: [
            BarChartRodData(
              y: 13,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 13, barRods: [
            BarChartRodData(
              y: 9,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 14, barRods: [
            BarChartRodData(
              y: 19,
              width: 20,
              colors: [Colors.orangeAccent],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
        ],
      ),
    );
  }
}
