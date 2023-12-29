import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/presentation/widgets/hikes/some_hikes_nearby.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/hikes/hikes.dart';
import '../widgets/shared/shared.dart';

class OverviewScreen extends ConsumerWidget {
  OverviewScreen({super.key});

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: () {
        refreshController.refreshCompleted();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general,
                      top: YahaSpaceSizes.small,
                    ),
                    child: const Column(
                      children: [
                        MessagingHeader(),
                        SomeHikesNearby(),
                        RandomHikesWorldwide(),
                        StatisticsSummaryLine(),
                        PreviousActivitesSummaryLine(),
                        ActiveHikesSummaryLine(),
                        /*Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: const CurrentChallengesSummaryLine(),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: const EventsSummaryLine(),
                        ),*/
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    ));
  }
}
