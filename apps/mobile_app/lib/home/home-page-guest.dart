import 'package:flutter/material.dart';
import 'package:yaha/home/explore-hike-box.dart';
import 'package:yaha/profile/statistics.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HomePageGuest extends StatefulWidget {
  @override
  _HomePageGuestState createState() => _HomePageGuestState();
}

class _HomePageGuestState extends State<HomePageGuest> {
  @override
  Widget build(BuildContext context) {
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
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: YahaSpaceSizes.general),
                                    child: Text(
                                      'Welcome!',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor),
                                    ),
                                  ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 135,
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Show more',
                                            style: TextStyle(
                                                fontSize: YahaFontSizes.small,
                                                fontWeight: FontWeight.w500,
                                                color: YahaColors.textColor),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            size: YahaFontSizes.xxLarge,
                                            color: YahaColors.textColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
