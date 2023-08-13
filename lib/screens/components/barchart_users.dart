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
                return 'jan 6';
              } else if (value == 4) {
                return 'jan 8';
              } else if (value == 6) {
                return 'jan 10';
              } else if (value == 8) {
                return 'jan 12';
              } else if (value == 10) {
                return 'jan 14';
              } else if (value == 12) {
                return 'jan 16';
              } else if (value == 14) {
                return 'jan 18';
              } else if (value == 16) {
                return 'jan 20';
              } else if (value == 18) {
                return 'jan 22';
              } else if (value == 20) {
                return 'jan 24';
              } else {
                return '';
              }
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(
              color: lightTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            margin: appPadding,
            getTitles: (double value) {
              if (value == 2) {
                return '1K';
              } else if (value == 6) {
                return '2K';
              } else if (value == 10) {
                return '3K';
              } else if (value == 14) {
                return '4K';
              } else if (value == 18) {
                return '5K';
              } else if (value == 22) {
                return '6K';
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
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
              y: 3,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
              y: 2,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
              y: 5,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
              y: 8,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
              y: 10,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
              y: 8,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
              y: 15,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
              y: 2,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
              y: 1,
              width: 15,
              colors: [Colors.lightBlue],
              borderRadius: BorderRadius.circular(5),
            ),
          ]),
        ],
      ),
    );
  }
}
