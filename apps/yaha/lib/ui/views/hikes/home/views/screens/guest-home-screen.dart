import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yaha/ui/presenters/home/guest-home-screen-presenter.dart';
import 'package:yaha/ui/views/hikes/home/views/widgets/active_hikes_summary_line.dart';
import 'package:yaha/ui/views/hikes/home/views/widgets/current_challenges_summary_line.dart';
import 'package:yaha/ui/views/hikes/home/views/widgets/events_summary_line.dart';
import 'package:yaha/ui/views/hikes/home/views/widgets/previous_activities_summary_line.dart';

import '../../../../shared/shared.dart';
import '../../../events/screens/event-detail-screen.dart';
import '../../../events/screens/events.dart';
import '../../../events/widgets/event-box.dart';
import '../../../hike/widgets/horizontal-hike-cards.dart';
import '../../../personal/screen/challenge-detail-screen.dart';
import '../../../personal/screen/challenges.dart';
import '../../../personal/widgets/challenge-box.dart';
import '../widgets/statistics_summary_line.dart';

class HomePageGuest extends ConsumerWidget {
  final PersistentTabController tabController;

  const HomePageGuest({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(guestHomeScreenMVPProvider);

    return Scaffold(
      body: CustomScrollView(
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
                        const GlobalHeader(),
                        Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.small),
                            child: HorizontalHikeCards(
                                title: 'Best hikes near you',
                                hikeListProvider:
                                    viewModel.bestHikesNearbyProvider)),
                        Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.small),
                            child: HorizontalHikeCards(
                                title: 'Best hikes of the world',
                                hikeListProvider:
                                    viewModel.bestHikesOfTheWorldProvider)),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
                          child: const StatisticsSummaryLine(),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: PreviousActivitesSummaryLine(
                              tabController: tabController),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: ActiveHikesSummaryLine(
                              tabController: tabController),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: const CurrentChallengesSummaryLine(),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: const EventsSummaryLine(),
                        ),
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
    );
  }
}
