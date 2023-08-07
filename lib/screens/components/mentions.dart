import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/data/data.dart';
import 'package:d_pos/screens/components/mentions_info_details.dart';
import 'package:flutter/material.dart';

class Mentions extends StatelessWidget {
  const Mentions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mentions',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: textColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: appPadding,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: discussionData.length,
              itemBuilder: (context, index) => MentionsInfoDetails(info: discussionData[index],),
            ),
          ),
        ],
      ),
    );
  }
}
