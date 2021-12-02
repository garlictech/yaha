import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class TrackingDataScreen extends ConsumerWidget {
  final int durationHours;
  final int durationMins;
  final int calories;
  final int actualSpeed;
  final int averageSpeed;
  final double distanceToNext;
  final int timeToNext;
  final double distanceToFinish;
  final int timeToFinishHours;
  final int timeToFinishMins;
  final double distance;
  final int timeCapsules;

  const TrackingDataScreen({
    Key? key,
    required this.durationHours,
    required this.durationMins,
    required this.calories,
    required this.actualSpeed,
    required this.averageSpeed,
    required this.distanceToNext,
    required this.timeToNext,
    required this.distanceToFinish,
    required this.timeToFinishHours,
    required this.timeToFinishMins,
    required this.distance,
    required this.timeCapsules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general,
                        top: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      durationHours.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: YahaSpaceSizes.xSmall),
                                      child: Text(
                                        'h',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      durationMins.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'min',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'DURATION',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      calories.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'kcal',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'CALORIES',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.xLarge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        actualSpeed.toString(),
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'km/h',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'ACTUAL SPEED',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        averageSpeed.toString(),
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'km/h',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'AVERAGE SPEED',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      distanceToNext.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'km',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'DISTANCE TO NEXT',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      timeToNext.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'min',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'TIME TO NEXT',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.xLarge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        distanceToFinish.toString(),
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'km',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'DISTANCE TO FINISH',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        timeToFinishHours.toString(),
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: YahaSpaceSizes.xSmall),
                                        child: Text(
                                          'h',
                                          style: TextStyle(
                                              color: YahaColors.textColor,
                                              fontSize: YahaFontSizes.medium,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        timeToFinishMins.toString(),
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'min',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'TIME TO FINISH',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      distance.toString(),
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'km',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'DISTANCE',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  timeCapsules.toString(),
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize:
                                          YahaFontSizes.trackingDataNumbers,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'TIMECAPSULES',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
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
          ),
        ],
      ),
    );
  }
}