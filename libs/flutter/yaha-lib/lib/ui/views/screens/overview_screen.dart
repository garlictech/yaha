import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_yaha_lib/ui/presenters/home/guest-home-screen-presenter.dart';
import 'package:flutter_yaha_lib/ui/views/hikes/horizontal-hike-cards.dart';
import 'package:flutter_yaha_lib/ui/views/hikes/active_hikes_summary_line.dart';
//import 'package:flutter_yaha_lib/ui/views/hikes/home/views/widgets/current_challenges_summary_line.dart';
//import 'package:flutter_yaha_lib/ui/views/hikes/home/views/widgets/events_summary_line.dart';
import 'package:flutter_yaha_lib/ui/views/hikes/previous_activities_summary_line.dart';
import 'package:flutter_yaha_lib/ui/views/hikes/statistics_summary_line.dart';
import 'package:flutter_yaha_lib/ui/views/hikes/random_hikes_worldwide.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class OverviewScreen extends ConsumerWidget {
  OverviewScreen({Key? key}) : super(key: key);

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(guestHomeScreenMVPProvider);

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
                    child: Column(
                      children: [
                        const MessagingHeader(),
                        HorizontalHikeCards(
                            title: 'Some hikes near you',
                            hikeListProvider:
                                viewModel.bestHikesNearbyProvider),
                        const RandomHikesWorldwide(),
                        const StatisticsSummaryLine(),
                        const PreviousActivitesSummaryLine(),
                        const ActiveHikesSummaryLine(),
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
