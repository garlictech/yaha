import 'package:flutter/material.dart';

import '../personal/statistics.dart';
import '../shared/section_title.dart';

class StatisticsSummaryLine extends StatelessWidget {
  const StatisticsSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionTitle(title: 'Statistics'),
        Statistics(
          hikes: 0,
          km: 0,
          hours: 0,
        ),

        /*const ShowMoreButton(
          nextScreen: StatisticsScreen(),
        ),*/
      ],
    );
  }
}
