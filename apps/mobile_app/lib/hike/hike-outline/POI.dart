import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class POI extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;

  const POI({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.poiLarge),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.small),
        color: backgroundColor,
        child: Container(
          child: Icon(
            icon,
            size: iconSize,
            color: YahaColors.background,
          ),
        ),
      ),
    );
  }
}
