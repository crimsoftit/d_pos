import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/view_line_chart.dart';
import 'package:flutter/material.dart';

class Viewers extends StatelessWidget {
  const Viewers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'viewers',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Expanded(
            child: ViewLineChart(),
          ),
        ],
      ),
    );
  }
}
