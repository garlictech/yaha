import 'package:flutter/material.dart';
import 'package:yaha/hike-outline/POI.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class Checkpoint extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;

  const Checkpoint({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
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
        color: backgroundColor.withOpacity(0.2),
        child: Row(
          children: [
            POI(
                backgroundColor: backgroundColor,
                icon: icon,
                iconSize: iconSize),
            Container(
              padding: EdgeInsets.only(left: YahaSpaceSizes.general),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
