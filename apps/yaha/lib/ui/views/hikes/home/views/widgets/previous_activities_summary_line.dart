import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import 'explore-hike-box.dart';

class PreviousActivitesSummaryLine extends StatelessWidget {
  final PersistentTabController tabController;

  const PreviousActivitesSummaryLine({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Previous activities',
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: YahaColors.textColor),
          ),
        ),
        ExploreHikeBox(
          topTitle:
              "You don’t have any activities yet. Once you complete a hike, you will see it here.",
          bottomTitle: "Isn’t it time you got outside?",
          tabController: tabController,
        ),
      ],
    );
  }
}
