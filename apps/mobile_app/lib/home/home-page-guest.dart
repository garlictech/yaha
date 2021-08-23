import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/auth/auth-state.dart';
import 'package:yaha/home/explore-hike-box.dart';
import 'package:yaha/home/show-more-button.dart';
import 'package:yaha/profile/statistics.dart';
import 'package:yaha/utility/challenge-box.dart';
import 'package:yaha/user/user-state.dart';
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
                        right: YahaSpaceSizes.general),
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
                                          left: YahaSpaceSizes.general),
                                      child: userState.when(
                                        loading: () =>
                                            const CircularProgressIndicator(),
                                        error: (err, stack) => Text('😱'),
                                        data: (state) => Text(
                                          'Hi ${state.nick}',
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
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: YahaSpaceSizes.medium),
                                height: 85,
                                width: MediaQuery.of(context).size.width,
                                child: Statistics(
                                  hikes: 0,
                                  km: 0,
                                  hours: 0,
                                ),
                              ),
                              ShowMoreButton(),
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
                                      fontSize: YahaFontSizes.small,
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
                                      fontSize: YahaFontSizes.small,
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
                                      fontSize: YahaFontSizes.small,
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
                                      padding: EdgeInsets.only(right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Complete a hike at night',
                                        icon:
                                            'assets/images/nightlight_black_24dp@3x.png',
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: YahaSpaceSizes.general),
                                      child: ChallengeBox(
                                        title: 'Complete a hike at night',
                                        icon:
                                            'assets/images/nightlight_black_24dp@3x.png',
                                      ),
                                    ),
                                    ChallengeBox(
                                      title: 'Complete a hike at night',
                                      icon:
                                          'assets/images/nightlight_black_24dp@3x.png',
                                    ),
                                  ],
                                ),
                              ),
                              ShowMoreButton(),
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
