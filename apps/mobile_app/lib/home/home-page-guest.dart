import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/auth/auth-state.dart';
import 'package:yaha/hike/hike-card/hike-card.dart';
import 'package:yaha/home/explore-hike-box.dart';
import 'package:yaha/home/show-more-button.dart';
import 'package:yaha/profile/challenges/challenges.dart';
import 'package:yaha/profile/events/event-detail-page.dart';
import 'package:yaha/profile/events/events.dart';
import 'package:yaha/profile/profile-page.dart';
import 'package:yaha/profile/statistics.dart';
import 'package:yaha/utility/challenge-box.dart';
import 'package:yaha/user/user-state.dart';
import 'package:yaha/utility/event-box.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HomePageGuest extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue userState = watch(userStateProvider);
    final authState = watch(authStateProvider);
    final authStateNotifier = watch(authStateProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(
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
                                  Container(
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
                                                    Text('😱'),
                                                data: (state) => Image.asset(
                                                      state.avatarImage,
                                                      fit: BoxFit.cover,
                                                    ))),
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: YahaSpaceSizes.medium),
                                      child: userState.when(
                                        loading: () =>
                                            const CircularProgressIndicator(),
                                        error: (err, stack) => Text('😱'),
                                        data: (state) => Text(
                                          'Hi ${state.nick}!',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.medium,
                                              fontWeight: FontWeight.w600,
                                              color: YahaColors.textColor),
                                        ),
                                      )),
                                  ...(authState.loggedIn
                                      ? [
                                          TextButton(
                                            child: Text("Logout"),
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
                                icon: Icon(Icons.notifications_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.general),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Statistics',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: YahaSpaceSizes.medium),
                                height: YahaBoxSizes.heigthXSmall,
                                width: MediaQuery.of(context).size.width,
                                child: Statistics(
                                  hikes: 0,
                                  km: 0,
                                  hours: 0,
                                ),
                              ),
                              ShowMoreButton(nextScreen: ProfilePage()),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Previous activities',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              ExploreHikeBox(
                                topTitle:
                                    "You don’t have any activities yet. Once you complete a hike, you will see it here.",
                                bottomTitle: "Isn’t it time you got outside?",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Continue hiking',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              ExploreHikeBox(
                                topTitle:
                                    "You haven’t started any hikes yet. If you pause a hike you can continue it here.",
                                bottomTitle: "Isn’t it time you got outside?",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Current challenges',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                height: YahaBoxSizes.heightGeneral,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Complete a hike at night',
                                        icon: 'assets/images/half_moon.png',
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Take 10 pictures during a hike',
                                        icon: 'assets/images/photo_camera.png',
                                      ),
                                    ),
                                    ChallengeBox(
                                      title: 'Complete a hike at night',
                                      icon: 'assets/images/half_moon.png',
                                    ),
                                  ],
                                ),
                              ),
                              ShowMoreButton(nextScreen: Challenges()),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Events starting next month',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                height: YahaBoxSizes.heightGeneral,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: EventBox(
                                          background:
                                              'assets/images/nagy-egedi-itura.png',
                                          height: YahaBoxSizes.heightGeneral,
                                          width: YahaBoxSizes.widthGeneral,
                                          nextScreen: EventDetailPage()),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      child: EventBox(
                                          background:
                                              'assets/images/bukki-batyus-barangolas.png',
                                          height: YahaBoxSizes.heightGeneral,
                                          width: YahaBoxSizes.widthGeneral,
                                          nextScreen: EventDetailPage()),
                                    ),
                                    EventBox(
                                        background:
                                            'assets/images/nagy-egedi-itura.png',
                                        height: YahaBoxSizes.heightGeneral,
                                        width: YahaBoxSizes.widthGeneral,
                                        nextScreen: EventDetailPage()),
                                  ],
                                ),
                              ),
                              ShowMoreButton(nextScreen: Events()),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Best hikes near you',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                height: YahaBoxSizes.heightMedium,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      width: YahaBoxSizes.widthMedium,
                                      child: HikeCard(
                                        title: 'Tura',
                                        subTitle:
                                            'Túrázás, vár, erdő, és barlang',
                                        //distanceFromCurrentLocation: 10,
                                        backgroundImage:
                                            'assets/images/tura.png',
                                      ),
                                    ),
                                    Container(
                                      width: YahaBoxSizes.widthMedium,
                                      child: HikeCard(
                                        title: 'Mátra',
                                        subTitle:
                                            'Mátra, erdős hegyek túrázáshoz',
                                        //distanceFromCurrentLocation: 10,
                                        backgroundImage:
                                            'assets/images/matra.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.large),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.medium),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Best hikes of the world',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                height: YahaBoxSizes.heightMedium,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: YahaSpaceSizes.general),
                                      width: YahaBoxSizes.widthMedium,
                                      child: HikeCard(
                                        title: 'Budapest',
                                        subTitle: 'Várhegy, Duna, Lánchíd',
                                        //distanceFromCurrentLocation: 10,
                                        backgroundImage:
                                            'assets/images/budapest.png',
                                      ),
                                    ),
                                    Container(
                                      width: YahaBoxSizes.widthMedium,
                                      child: HikeCard(
                                        title: 'Balaton',
                                        subTitle:
                                            'Nagy édesvizű tó üdülővárosokkal',
                                        //distanceFromCurrentLocation: 10,
                                        backgroundImage:
                                            'assets/images/balaton.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

  showAlertDialog(BuildContext context, authStateNotifier) {
    Widget continueButton = TextButton(
      child: Text("OK, I'm logged in"),
      onPressed: () {
        Navigator.of(context).pop();
        authStateNotifier.loggedIn();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Login effect simulator"),
      content:
          Text("Ok, the login window was up, you logged in successfully.."),
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
