import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/home/guest-home-screen-presenter.dart';
import 'package:yaha/domain/states/auth/auth-state.dart';
import 'package:yaha/domain/states/user/user-state.dart';

import '../../../events/screens/event-detail-screen.dart';
import '../../../events/screens/events.dart';
import '../../../events/widgets/event-box.dart';
import '../../../hikes/screens/explore-screen.dart';
import '../../../hikes/widgets/horizontal-hike-cards.dart';
import '../../../personal/screen/challenge-detail-screen.dart';
import '../../../personal/screen/challenges.dart';
import '../../../personal/screen/statistics-screen.dart';
import '../../../personal/widgets/challenge-box.dart';
import '../../../personal/widgets/statistics.dart';
import '../../../shared/shared.dart';
import '../widgets/explore-hike-box.dart';

class HomePageGuest extends ConsumerWidget {
  const HomePageGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue userState = ref.watch(userStateProvider);
    final authState = ref.watch(authStateProvider);
    final authStateNotifier = ref.watch(authStateProvider.notifier);
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
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            YahaBorderRadius.xSmall),
                                        child: TextButton(
                                            onPressed: () {
                                              showAlertDialog(
                                                  context, authStateNotifier);
                                            },
                                            child: userState.when(
                                                loading: () =>
                                                    const CircularProgressIndicator(),
                                                error: (err, stack) =>
                                                    const Text('😱'),
                                                data: (state) => Image.asset(
                                                      state.avatarImage,
                                                      fit: BoxFit.cover,
                                                    ))),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: YahaSpaceSizes.medium),
                                      child: userState.when(
                                        loading: () =>
                                            const CircularProgressIndicator(),
                                        error: (err, stack) => const Text('😱'),
                                        data: (state) => Text(
                                          'Hi ${state.nick}!',
                                          style: const TextStyle(
                                              fontSize: YahaFontSizes.medium,
                                              fontWeight: FontWeight.w600,
                                              color: YahaColors.textColor),
                                        ),
                                      )),
                                  ...(authState.loggedIn
                                      ? [
                                          TextButton(
                                            child: const Text("Logout"),
                                            onPressed: () =>
                                                authStateNotifier.logout(),
                                          )
                                        ]
                                      : [])
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                iconSize: YahaFontSizes.xxLarge,
                                color: YahaColors.textColor,
                                icon: const Icon(Icons.notifications_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Statistics',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.medium),
                                height: YahaBoxSizes.heigthXSmall,
                                width: MediaQuery.of(context).size.width,
                                child: const Statistics(
                                  hikes: 0,
                                  km: 0,
                                  hours: 0,
                                ),
                              ),
                              const ShowMoreButton(
                                nextScreen: StatisticsScreen(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Previous activities',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              const ExploreHikeBox(
                                topTitle:
                                    "You don’t have any activities yet. Once you complete a hike, you will see it here.",
                                bottomTitle: "Isn’t it time you got outside?",
                                onPressed: ExploreScreen(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Continue hiking',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              const ExploreHikeBox(
                                topTitle:
                                    "You haven’t started any hikes yet. If you pause a hike you can continue it here.",
                                bottomTitle: "Isn’t it time you got outside?",
                                onPressed: ExploreScreen(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Current challenges',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              SizedBox(
                                height: YahaBoxSizes.heightGeneral,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Complete a hike at night',
                                        icon: 'assets/images/half_moon.png',
                                        nextScreen: ChallengeDetailScreen(),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Take 10 pictures during a hike',
                                        icon: 'assets/images/photo_camera.png',
                                        nextScreen: ChallengeDetailScreen(),
                                      ),
                                    ),
                                    ChallengeBox(
                                      title: 'Complete a hike at night',
                                      icon: 'assets/images/half_moon.png',
                                      nextScreen: ChallengeDetailScreen(),
                                    ),
                                  ],
                                ),
                              ),
                              const ShowMoreButton(nextScreen: Challenges()),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Events starting next month',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              SizedBox(
                                height: YahaBoxSizes.heightGeneral,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: const EventBox(
                                          background:
                                              'assets/images/nagy-egedi-itura.png',
                                          height: YahaBoxSizes.heightGeneral,
                                          width: YahaBoxSizes.widthGeneral,
                                          nextScreen: EventDetailScreen()),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: const EventBox(
                                          background:
                                              'assets/images/bukki-batyus-barangolas.png',
                                          height: YahaBoxSizes.heightGeneral,
                                          width: YahaBoxSizes.widthGeneral,
                                          nextScreen: EventDetailScreen()),
                                    ),
                                    const EventBox(
                                        background:
                                            'assets/images/nagy-egedi-itura.png',
                                        height: YahaBoxSizes.heightGeneral,
                                        width: YahaBoxSizes.widthGeneral,
                                        nextScreen: EventDetailScreen()),
                                  ],
                                ),
                              ),
                              const ShowMoreButton(nextScreen: Events()),
                            ],
                          ),
                        ),
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

  showAlertDialog(BuildContext context, authStateNotifier) {
    Widget continueButton = TextButton(
      child: const Text("OK, I'm logged in"),
      onPressed: () {
        Navigator.of(context).pop();
        authStateNotifier.loggedIn();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Login effect simulator"),
      content: const Text(
          "Ok, the login window was up, you logged in successfully.."),
      actions: [
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
