import 'package:flutter/material.dart';
import '../../events/screens/events.dart';
import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-border-width.dart';
import '../../shared/widgets/yaha-box-sizes.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import '../../time-capsules/screens/timecapsules-screen.dart';
import '../widgets/statistics.dart';
import 'bookmarked-hikes.dart';
import 'challenges.dart';
import 'settings-screen.dart';
import 'statistics-screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(YahaSpaceSizes.general),
                          height: YahaBoxSizes.heightGeneral,
                          width: YahaBoxSizes.widthGeneral,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Image.asset(
                              'assets/images/profile-authenticated.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: const Text('John Doe',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
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
                                  child: const Icon(
                                    Icons.location_on_outlined,
                                    color: YahaColors.primary,
                                  )),
                              const Text('Taktaharkány',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.textColor)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
                          height: YahaBoxSizes.heigthXSmall,
                          width: MediaQuery.of(context).size.width,
                          child: const Statistics(
                            hikes: 34,
                            km: 370,
                            hours: 54,
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return SettingsScreen();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.medium,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Settings',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                            const Divider(
                                color: YahaColors.divider,
                                thickness: YahaBorderWidth.xxSmall),
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return const Events();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Events',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                            const Divider(
                                color: YahaColors.divider,
                                thickness: YahaBorderWidth.xxSmall),
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return const Challenges();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Challanges',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                            const Divider(
                                color: YahaColors.divider,
                                thickness: YahaBorderWidth.xxSmall),
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return StatisticsScreen();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Statistics',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                            const Divider(
                                color: YahaColors.divider,
                                thickness: YahaBorderWidth.xxSmall),
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return const TimeCapsulesScreen();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('TimeCapsules',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                            const Divider(
                                color: YahaColors.divider,
                                thickness: YahaBorderWidth.xxSmall),
                            InkWell(
                              onTap: () {
                                Navigator.of(this.context).push(
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) {
                                  return const BookmarkedHikes();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.small),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Bookmarked hikes',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
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
                          ],
                        ),
                      ],
                    ),
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
