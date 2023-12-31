import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/drawer_list_tile.dart';
import 'package:d_pos/screens/items_list.dart';
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
            child: Image.asset('assets/images/logo_main.png'),
          ),
          DrawerListTile(
              title: 'dashboard',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {}),
          DrawerListTile(
              title: 'messages',
              svgSrc: 'assets/icons/Message.svg',
              tap: () {}),
          DrawerListTile(
              title: 'inventory',
              svgSrc: 'assets/icons/inventory.svg',
              tap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const ItemsList();
                }));
              }),
          DrawerListTile(
              title: 'sales', svgSrc: 'assets/icons/stock.svg', tap: () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'statistics',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
          DrawerListTile(
              title: 'settings',
              svgSrc: 'assets/icons/Settings.svg',
              tap: () {}),
          DrawerListTile(
              title: 'logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
