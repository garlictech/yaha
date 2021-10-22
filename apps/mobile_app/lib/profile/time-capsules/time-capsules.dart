import 'package:flutter/material.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class TimeCapsules extends StatelessWidget {
  const TimeCapsules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: YahaBackButton(),
          backgroundColor: YahaColors.background,
          title: Text(
            'Events',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            labelColor: YahaColors.primary,
            unselectedLabelColor: YahaColors.textColor,
            indicatorColor: YahaColors.primary,
            tabs: [
              Tab(text: 'Found TimeCapsules'),
              Tab(text: 'My TimeCapsules'),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
              left: YahaSpaceSizes.medium,
              right: YahaSpaceSizes.medium,
              top: YahaSpaceSizes.large),
        ),
      ),
    );
  }
}
