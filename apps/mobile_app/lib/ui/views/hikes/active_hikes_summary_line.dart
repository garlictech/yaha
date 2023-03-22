import 'package:flutter/material.dart';

import '../shared/shared.dart';
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
          child: Text(
            'Continue hiking',
            style: Theme.of(context).textTheme.titleMedium,
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
