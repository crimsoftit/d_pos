import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/radial_painter.dart';
import 'package:flutter/material.dart';

class UsersByDevice extends StatelessWidget {
  const UsersByDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'users by device',
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(appPadding),
              padding: const EdgeInsets.all(appPadding),
              height: 230,
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: textColor.withOpacity(0.3),
                  lineColor: primaryColor,
                  percent: 0.7,
                  width: 18.0,
                ),
                child: const Center(
                  child: Text(
                    '70%',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: appPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 10,
                      ),
                      const SizedBox(
                        width: appPadding / 2,
                      ),
                      Text(
                        'desktop',
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 10,
                      ),
                      const SizedBox(
                        width: appPadding / 2,
                      ),
                      Text(
                        'mobile',
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
