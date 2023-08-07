import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/barchart_users.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "users",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: textColor,
            ),
          ),
          Expanded(
            child: BarChartUsers(),
          ),
        ],
      ),
    );
  }
}
