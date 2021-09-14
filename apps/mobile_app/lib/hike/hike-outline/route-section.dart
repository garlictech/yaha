import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

// We have to move these classes somewhere else
class RouteSectionModel {
  final String routeLengthInTime;
  final String routeLengthInTimeMetrics;
  final String routeLength;
  final String routeLengthMetrics;

  const RouteSectionModel({
    required this.routeLengthInTime,
    required this.routeLengthInTimeMetrics,
    required this.routeLength,
    required this.routeLengthMetrics,
  });
}

class RouteSection extends StatelessWidget {
  final RouteSectionModel routeSectionModel;

  const RouteSection({Key? key, required this.routeSectionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.general),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.small),
        constraints: BoxConstraints(
          maxWidth: YahaBoxSizes.sectionWidthMax,
        ),
        height: YahaBoxSizes.sectionHeight,
        color: YahaColors.tertiaryAccentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: YahaSpaceSizes.medium),
              child: Icon(
                Icons.hiking_rounded,
                size: YahaIconSizes.large,
                color: YahaColors.textColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: YahaSpaceSizes.xxSmall),
                  child: Row(
                    children: [
                      Text(
                        routeSectionModel.routeLength,
                        style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor,
                        ),
                      ),
                      Text(
                        routeSectionModel.routeLengthMetrics,
                        style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      routeSectionModel.routeLengthInTime,
                      style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w600,
                        color: YahaColors.textColor,
                      ),
                    ),
                    Text(
                      routeSectionModel.routeLengthInTimeMetrics,
                      style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w400,
                        color: YahaColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: YahaIconSizes.medium,
                color: YahaColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
