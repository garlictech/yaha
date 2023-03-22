import 'package:flutter/material.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import 'explore-hike-box.dart';

class PreviousActivitesSummaryLine extends StatelessWidget {
  const PreviousActivitesSummaryLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
          alignment: Alignment.centerLeft,
          child: Text(
            'Previous activities',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const ExploreHikeBox(
          topTitle:
              "You don’t have any activities yet. Once you complete a hike, you will see it here.",
          bottomTitle: "Isn’t it time you got outside?",
        ),
      ],
    );
  }
}
