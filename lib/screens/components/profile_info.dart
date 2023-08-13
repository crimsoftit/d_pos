import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Stack(
            children: [
              SvgPicture.asset(
                'icons/Bell.svg',
                height: 25,
                color: textColor.withOpacity(0.8),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: red,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: appPadding),
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding / 2),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/batman.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              if (!Responsive.isMobile(context))
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
                  child: Text(
                    'aje batman',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
