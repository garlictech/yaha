import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/hikes/list-section-title-box-widget.dart';

import '../../shared/widgets/yaha-border-width.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import '../widgets/timecapsule-list-tile-widget.dart';

class FoundTimeCapsulesScreen extends ConsumerWidget {
  const FoundTimeCapsulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: const [
                      ListSectionTitleBox(
                          title: 'November 2021',
                          backgroundColor: YahaColors.accentColor,
                          titleColor: YahaColors.textColor,
                          iconVisibility: false),
                      Padding(
                        padding: EdgeInsets.only(top: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '12.11.2021',
                          secondLine: 'Found it',
                          whoPlacedItVisibility: true,
                          contentVisibility: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.small),
                        child: Divider(
                            color: YahaColors.divider,
                            thickness: YahaBorderWidth.xxSmall),
                      ),
                      TimeCapsuleListTileWidget(
                        date: '19.11.2021',
                        secondLine: 'Found it',
                        whoPlacedItVisibility: true,
                        contentVisibility: false,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.small),
                        child: Divider(
                            color: YahaColors.divider,
                            thickness: YahaBorderWidth.xxSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '29.11.2021',
                          secondLine: 'Found it',
                          whoPlacedItVisibility: true,
                          contentVisibility: false,
                        ),
                      ),
                      ListSectionTitleBox(
                          title: 'December 2021',
                          backgroundColor: YahaColors.accentColor,
                          titleColor: YahaColors.textColor,
                          iconVisibility: false),
                      Padding(
                        padding: EdgeInsets.only(top: YahaSpaceSizes.medium),
                        child: TimeCapsuleListTileWidget(
                          date: '05.12.2021',
                          secondLine: 'Found it',
                          whoPlacedItVisibility: true,
                          contentVisibility: false,
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
