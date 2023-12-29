import 'package:flutter/material.dart';

import '../shared/section_title.dart';
import 'explore-hike-box.dart';

class PreviousActivitesSummaryLine extends StatelessWidget {
  const PreviousActivitesSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionTitle(title: 'Previous activities'),
        ExploreHikeBox(
          topTitle:
              "You don’t have any activities yet. Once you complete a hike, you will see it here.",
          bottomTitle: "Isn’t it time you got outside?",
        ),
      ],
    );
  }
}
