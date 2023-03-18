import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import 'explore-hike-box.dart';

class ActiveHikesSummaryLine extends StatelessWidget {
  const ActiveHikesSummaryLine({Key? key}) : super(key: key);

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
        const ExploreHikeBox(
          topTitle:
              "You haven’t started any hikes yet. If you pause a hike you can continue it here.",
          bottomTitle: "Isn’t it time you got outside?",
        ),
      ],
    );
  }
}
