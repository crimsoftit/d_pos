import 'package:flutter/material.dart';
import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/models/analytic_info_model.dart';
import 'package:flutter_svg/svg.dart';

class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard({super.key, required this.info});

  final AnalyticInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "${info.count}",
                style: const TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: info.color,
                ),
              ),
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
