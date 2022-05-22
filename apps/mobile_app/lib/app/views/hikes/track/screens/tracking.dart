import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'tracking-data-screen.dart';
import 'tracking-map-screen.dart';
import 'tracking-timecapsule-screen.dart';
import 'tracking-timeline-screen.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          //leading: YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: const Text(
            'Track',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            labelColor: YahaColors.primary,
            unselectedLabelColor: YahaColors.textColor,
            indicatorColor: YahaColors.primary,
            labelPadding: EdgeInsets.only(left: 22, right: 22),
            isScrollable: true,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: YahaFontSizes.xSmall),
            tabs: [
              Tab(text: 'Map'),
              Tab(text: 'Timeline'),
              Tab(text: 'Data'),
              Tab(text: 'TimeCapsule')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TrackingMapScreen(),
            const TrackingTimelineScreen(),
            const TrackingDataScreen(
              durationHours: 2,
              durationMins: 1,
              calories: 59,
              actualSpeed: 8,
              averageSpeed: 5,
              distanceToNext: 1.2,
              timeToNext: 15,
              distanceToFinish: 8,
              timeToFinishHours: 5,
              timeToFinishMins: 13,
              distance: 12,
              timeCapsules: 4,
            ),
            const TrackingTimeCapsuleScreen(collectedTimeCapsules: 4),
          ],
        ),
      ),
    );
  }
}
