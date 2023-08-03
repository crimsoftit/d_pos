import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(appPadding),
            child: Image.asset('images/logo_main.png'),
          ),
          DrawerListTile(
              title: 'dashboard', svgSrc: 'icons/Dashboard.svg', tap: () {}),
          DrawerListTile(
              title: 'messages', svgSrc: 'icons/Message.svg', tap: () {}),
          DrawerListTile(
              title: 'inventory', svgSrc: 'icons/inventory.svg', tap: () {}),
          DrawerListTile(title: 'sales', svgSrc: 'icons/stock.svg', tap: () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'statistics', svgSrc: 'icons/Statistics.svg', tap: () {}),
          DrawerListTile(
              title: 'settings', svgSrc: 'icons/Settings.svg', tap: () {}),
          DrawerListTile(
              title: 'logout', svgSrc: 'icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
