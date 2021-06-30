import 'package:flutter/material.dart';
import 'package:mobile_app/settings-page.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        height: 160,
                        width: 160,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: Text('John Doe',
                            style: TextStyle(
                                fontSize: YahaFontSizes.large,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor)),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.xSmall),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: YahaColors.primary,
                                )),
                            Text('Taktaharkány',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor)),
                          ],
                        ),
                      ),
                      Container(
                        height: 85,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(YahaSpaceSizes.large),
                        decoration: BoxDecoration(
                          color: YahaColors.tertiaryAccentColor,
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(YahaSpaceSizes.medium),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('34',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.large,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor)),
                                  Text('hikes',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ],
                              ),
                              VerticalDivider(
                                  color: YahaColors.divider, thickness: 2),
                              Column(
                                children: [
                                  Text('370',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.large,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor)),
                                  Text('km',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ],
                              ),
                              VerticalDivider(
                                  color: YahaColors.divider, thickness: 2),
                              Column(
                                children: [
                                  Text('54',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.large,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor)),
                                  Text('hours',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    new MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return new SettingsPage();
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Settings',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w400,
                                            color: YahaColors.textColor)),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: YahaColors.primary,
                                      size: YahaFontSizes.xxLarge,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: YahaColors.divider, thickness: 1),
                            Container(
                              margin: EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Events',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: YahaColors.primary,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                            Divider(color: YahaColors.divider, thickness: 1),
                            Container(
                              margin: EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Challanges',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: YahaColors.primary,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                            Divider(color: YahaColors.divider, thickness: 1),
                            Container(
                              margin: EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Statistics',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: YahaColors.primary,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                            Divider(color: YahaColors.divider, thickness: 1),
                            Container(
                              margin: EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TimeCapsules',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: YahaColors.primary,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                            Divider(color: YahaColors.divider, thickness: 1),
                            Container(
                              margin: EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bookmarked hikes',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: YahaColors.primary,
                                    size: YahaFontSizes.xxLarge,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
