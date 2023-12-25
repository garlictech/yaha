import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

import '../shared/section_title.dart';
import 'explore-hike-box.dart';

class PreviousActivitesSummaryLine extends StatelessWidget {
  const PreviousActivitesSummaryLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
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
