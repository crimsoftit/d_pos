import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/models/referal_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReferralInfoDetails extends StatelessWidget {
  const ReferralInfoDetails({super.key, required this.info});

  final ReferalInfoModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding * 1.5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(appPadding / 1.5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: info.color!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              info.svgSrc!,
              color: info.color,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    info.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                  Text(
                    '${info.count!}',
                    style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
