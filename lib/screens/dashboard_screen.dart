
import 'package:flutter/material.dart';
import 'package:d_pos/controllers/controller.dart';
import 'package:provider/provider.dart';
import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/constants/responsive.dart';
import 'package:d_pos/screens/components/dashboard_content.dart';
import 'package:d_pos/screens/components/drawer_menu.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(child: DrawerMenu()),
          const Expanded(
            flex: 5,
            child: DashboardContent(),
          )
        ],
      )),
    );
  }
}
