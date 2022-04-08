import 'package:flutter/material.dart';

import '../../shared/widgets/buttons/back-button.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import 'all-events.dart';
import 'ongoing-events.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: const Text(
            'Events',
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
              Tab(text: 'All events'),
              Tab(text: 'Ongoig events'),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.medium,
              right: YahaSpaceSizes.medium,
              top: YahaSpaceSizes.large),
          child: TabBarView(
            children: [
              AllEvents(),
              OngoingEvents(),
            ],
          ),
        ),
      ),
    );
  }
}
