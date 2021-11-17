import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/views/widgets/list-section-title-box-widget.dart';
import 'package:yaha/profile/time-capsules/views/widgets/timecapsule-list-tile-widget.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class MyTimeCapsulesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      ListSectionTitleBox(
                          title: 'November 2021',
                          backgroundColor: YahaColors.accentColor,
                          titleColor: YahaColors.textColor,
                          iconVisibility: false),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '12.11.2021',
                          secondLine: 'Placed it',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.small),
                        child: Divider(
                            color: YahaColors.divider,
                            thickness: YahaBorderWidth.xxSmall),
                      ),
                      TimeCapsuleListTileWidget(
                        date: '19.11.2021',
                        secondLine: 'Placed it',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.small),
                        child: Divider(
                            color: YahaColors.divider,
                            thickness: YahaBorderWidth.xxSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '29.11.2021',
                          secondLine: 'Placed it',
                        ),
                      ),
                      ListSectionTitleBox(
                          title: 'December 2021',
                          backgroundColor: YahaColors.accentColor,
                          titleColor: YahaColors.textColor,
                          iconVisibility: false),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '05.12.2021',
                          secondLine: 'Placed it',
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
