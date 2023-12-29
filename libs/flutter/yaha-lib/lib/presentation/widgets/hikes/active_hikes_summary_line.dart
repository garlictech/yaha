import 'package:flutter/material.dart';

import '../shared/section_title.dart';
import 'explore-hike-box.dart';

class ActiveHikesSummaryLine extends StatelessWidget {
  const ActiveHikesSummaryLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionTitle(title: 'Current activities'),
        ExploreHikeBox(
          topTitle:
              "You haven’t started any hikes yet. If you pause a hike you can continue it here.",
          bottomTitle: "Isn’t it time you got outside?",
        ),
      ],
    );
  }
}
