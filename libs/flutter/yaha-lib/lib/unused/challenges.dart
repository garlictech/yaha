import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

import 'all-challenges.dart';
import 'my-challenges.dart';

class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: const Text(
            'Challenges',
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
              Tab(text: 'All challenges'),
              Tab(text: 'My challenges'),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.medium,
              right: YahaSpaceSizes.medium,
              top: YahaSpaceSizes.large),
          child: const TabBarView(
            children: [
              AllChallenges(),
              MyChallenges(),
            ],
          ),
        ),
      ),
    );
  }
}
