import 'package:flutter/material.dart';
import 'package:yaha/hike-outline/POI.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class Checkpoint extends StatelessWidget {
  final String title;
  final Color boxBackgorundColor;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final String estimatedArrival;

  const Checkpoint({
    Key? key,
    required this.title,
    required this.boxBackgorundColor,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
    required this.estimatedArrival,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.general),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.small),
        constraints: BoxConstraints(
          maxWidth: YahaBoxSizes.checkpointWidthMax,
        ),
        height: YahaBoxSizes.checkpointHeight,
        color: boxBackgorundColor.withOpacity(0.2),
        child: Row(
          children: [
            POI(
                backgroundColor: backgroundColor,
                icon: icon,
                iconSize: iconSize),
            Container(
              padding: EdgeInsets.only(
                left: YahaSpaceSizes.general,
                right: YahaSpaceSizes.general,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.w600,
                      color: YahaColors.textColor,
                    ),
                  ),
                  Row(children: [

                  ],),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  estimatedArrival,
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
