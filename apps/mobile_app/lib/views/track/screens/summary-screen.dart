import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SummaryScreen extends ConsumerWidget {
  final int length;
  final int durationHours;
  final int durationMins;
  final int averageSpeed;
  final int checkpoints;
  final int uphill;
  final int downhill;
  final int calories;
  final int points;

  const SummaryScreen({
    Key? key,
    required this.length,
    required this.durationHours,
    required this.durationMins,
    required this.averageSpeed,
    required this.checkpoints,
    required this.uphill,
    required this.downhill,
    required this.calories,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Summary',
          style: TextStyle(
              color: YahaColors.textColor,
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: YahaColors.background,
        elevation: 0,
      ),
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
                        top: YahaSpaceSizes.small),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                child: Image.asset(
                                  'assets/images/elevation.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.medium,
                                    right: YahaSpaceSizes.medium),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        YahaBorderRadius.semiSmall),
                                    child: Container(
                                      color:
                                          YahaColors.textColor.withOpacity(0.8),
                                      width: 42,
                                      height: 42,
                                      child: Icon(
                                        Icons.open_in_full_rounded,
                                        color: YahaColors.background,
                                        size: YahaIconSizes.medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.semiLarge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: YahaSpaceSizes.medium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              length.toString(),
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
                                                  fontSize:
                                                      YahaFontSizes.medium,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'LENGTH',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.small,
                                              fontWeight: FontWeight.w500,
                                              color: YahaColors.grey600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  fontSize:
                                                      YahaFontSizes.medium,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            durationMins.toString(),
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
                                        top: YahaSpaceSizes.medium,
                                        bottom: YahaSpaceSizes.medium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              uphill.toString(),
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
                                                  fontSize:
                                                      YahaFontSizes.medium,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'UPHILL',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.small,
                                              fontWeight: FontWeight.w500,
                                              color: YahaColors.grey600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                fontSize: YahaFontSizes
                                                    .trackingDataNumbers,
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
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: YahaSpaceSizes.medium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                  fontSize:
                                                      YahaFontSizes.medium,
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
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            checkpoints.toString(),
                                            style: TextStyle(
                                                color: YahaColors.textColor,
                                                fontSize: YahaFontSizes
                                                    .trackingDataNumbers,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'CHECKPOINTS',
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w500,
                                            color: YahaColors.grey600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: YahaSpaceSizes.medium,
                                        bottom: YahaSpaceSizes.medium),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              downhill.toString(),
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
                                                'km',
                                                style: TextStyle(
                                                    color: YahaColors.textColor,
                                                    fontSize:
                                                        YahaFontSizes.medium,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'DOWNHILL',
                                          style: TextStyle(
                                              fontSize: YahaFontSizes.small,
                                              fontWeight: FontWeight.w500,
                                              color: YahaColors.grey600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            points.toString(),
                                            style: TextStyle(
                                                color: YahaColors.textColor,
                                                fontSize: YahaFontSizes
                                                    .trackingDataNumbers,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'POINTS',
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
                        SizedBox(
                          height: YahaBoxSizes.buttonHeight,
                          width: YahaBoxSizes.buttonWidthBig,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Done',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
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
