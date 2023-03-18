import 'package:flutter/material.dart';
import 'package:yaha/ui/views/personal/screen/statistics-screen.dart';
import 'package:yaha/ui/views/personal/widgets/statistics.dart';
import 'package:yaha/ui/views/shared/shared.dart';

class StatisticsSummaryLine extends StatelessWidget {
  const StatisticsSummaryLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Statistics',
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: YahaColors.textColor),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: YahaSpaceSizes.medium),
          child: const Statistics(
            hikes: 0,
            km: 0,
            hours: 0,
          ),
        ),
        const ShowMoreButton(
          nextScreen: StatisticsScreen(),
        ),
      ],
    );
  }
}
