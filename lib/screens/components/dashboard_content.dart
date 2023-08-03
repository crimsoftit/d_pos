import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [CustomAppbar()],
        ),
      ),
    );
  }
}
