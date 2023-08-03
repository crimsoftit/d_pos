import 'package:d_pos/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:d_pos/screens/components/profile_info.dart';
import 'package:d_pos/screens/components/search_field.dart';
import 'package:d_pos/constants/responsive.dart';
import 'package:d_pos/controllers/controller.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: context.read<Controller>().controlMenu,
              icon: Icon(
                Icons.menu,
                color: textColor.withOpacity(0.5),
              )),
        const Expanded(child: SearchField()),
        const ProfileInfo()
      ],
    );
  }
}
