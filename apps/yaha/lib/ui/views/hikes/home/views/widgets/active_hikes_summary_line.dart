import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../shared/shared.dart';
import 'explore-hike-box.dart';

class ActiveHikesSummaryLine extends StatelessWidget {
  final PersistentTabController tabController;
  const ActiveHikesSummaryLine({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Continue hiking',
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: YahaColors.textColor),
          ),
        ),
        ExploreHikeBox(
          topTitle:
              "You haven’t started any hikes yet. If you pause a hike you can continue it here.",
          bottomTitle: "Isn’t it time you got outside?",
          tabController: tabController,
        ),
      ],
    );
  }
}
