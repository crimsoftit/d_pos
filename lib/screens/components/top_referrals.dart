import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/data/data.dart';
import 'package:d_pos/screens/components/referral_info_details.dart';
import 'package:flutter/material.dart';

class TopReferrals extends StatelessWidget {
  const TopReferrals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
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
                'top referrals...',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              Text(
                'view all',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor.withOpacity(0.5),
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
              itemCount: referalData.length,
              itemBuilder: (context, index) => ReferralInfoDetails(
                info: referalData[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
