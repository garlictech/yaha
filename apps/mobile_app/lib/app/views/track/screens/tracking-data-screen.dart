import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';

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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
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
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'min',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'DURATION',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.xLarge,
                                  bottom: YahaSpaceSizes.xLarge),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        actualSpeed.toString(),
                                        style: const TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        'km/h',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'ACTUAL SPEED',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
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
                                      distanceToNext.toString(),
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'km',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'DISTANCE TO NEXT',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.xLarge,
                                  bottom: YahaSpaceSizes.xLarge),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        distanceToFinish.toString(),
                                        style: const TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        'km',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'DISTANCE TO FINISH',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
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
                                      distance.toString(),
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'km',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'DISTANCE',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
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
                                      calories.toString(),
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'kcal',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'CALORIES',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.xLarge,
                                  bottom: YahaSpaceSizes.xLarge),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        averageSpeed.toString(),
                                        style: const TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        'km/h',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'AVERAGE SPEED',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
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
                                      style: const TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize:
                                              YahaFontSizes.trackingDataNumbers,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'min',
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'TIME TO NEXT',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.grey600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.xLarge,
                                  bottom: YahaSpaceSizes.xLarge),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        timeToFinishHours.toString(),
                                        style: const TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
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
                                        style: const TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes
                                                .trackingDataNumbers,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        'min',
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.medium,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'TIME TO FINISH',
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.grey600),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  timeCapsules.toString(),
                                  style: const TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize:
                                          YahaFontSizes.trackingDataNumbers,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
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
