import 'package:d_pos/constants/responsive.dart';
import 'package:d_pos/screens/components/mentions.dart';
import 'package:d_pos/screens/components/top_referrals.dart';
import 'package:d_pos/screens/components/users.dart';
import 'package:d_pos/screens/components/viewers.dart';
import 'package:flutter/material.dart';
import 'package:d_pos/constants/constants.dart';
import 'package:d_pos/screens/components/custom_appbar.dart';
import 'package:d_pos/screens/components/analytic_cards.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            const CustomAppbar(),
            const SizedBox(
              height: appPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const AnalyticCards(),
                      const SizedBox(
                        height: appPadding,
                      ),
                      const Users(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: appPadding,
                        ),
                      if (Responsive.isMobile(context)) const Mentions(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: appPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: Mentions(),
                  ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TopReferrals(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Viewers(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: appPadding,
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: appPadding,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
