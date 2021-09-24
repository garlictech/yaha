import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';

class Poi extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final double padding;

  const Poi({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.poiLarge),
      child: Container(
        padding: EdgeInsets.all(padding),
        color: backgroundColor,
        child: Container(
          child: Container(
            child: Icon(
              icon,
              size: iconSize,
              color: YahaColors.background,
            ),
          ),
        ),
      ),
    );
  }
}
