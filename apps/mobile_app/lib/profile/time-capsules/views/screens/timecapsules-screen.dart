import 'package:flutter/material.dart';
import 'package:yaha/profile/time-capsules/views/screens/found-timecapsules-screen.dart';
import 'package:yaha/profile/time-capsules/views/screens/my-timecapsules-screen.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

class TimeCapsulesScreen extends StatelessWidget {
  const TimeCapsulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: Text(
            'TimeCapsules',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
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
        body: TabBarView(
          children: [
            FoundTimeCapsulesScreen(),
            MyTimeCapsulesScreen(),
          ],
        ),
      ),
    );
  }
}
