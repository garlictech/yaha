import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import 'found-timecapsules-screen.dart';
import 'my-timecapsules-screen.dart';

class TimeCapsulesScreen extends StatelessWidget {
  const TimeCapsulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: const Text(
            'TimeCapsules',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            labelColor: YahaColors.primary,
            unselectedLabelColor: YahaColors.textColor,
            indicatorColor: YahaColors.primary,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: YahaFontSizes.xSmall),
            tabs: [
              Tab(text: 'Found TimeCapsules'),
              Tab(text: 'My TimeCapsules'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FoundTimeCapsulesScreen(),
            MyTimeCapsulesScreen(),
          ],
        ),
      ),
    );
  }
}
