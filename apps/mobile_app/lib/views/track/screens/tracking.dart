import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/views/track/screens/tracking-data-screen.dart';
import 'package:yaha/views/track/screens/tracking-map-screen.dart';
import 'package:yaha/views/track/screens/tracking-timecapsule-screen.dart';
import 'package:yaha/views/track/screens/tracking-timeline-screen.dart';

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
          title: Text(
            'Track',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
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
            TrackingTimelineScreen(),
            TrackingDataScreen(),
            TrackingTimeCapsuleScreen(),
          ],
        ),
      ),
    );
  }
}
