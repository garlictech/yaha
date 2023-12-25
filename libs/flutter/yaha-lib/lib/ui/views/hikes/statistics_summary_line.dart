import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/personal/statistics.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

import '../shared/section_title.dart';

class StatisticsSummaryLine extends StatelessWidget {
  const StatisticsSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
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
