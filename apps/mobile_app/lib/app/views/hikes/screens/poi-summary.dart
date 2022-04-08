import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class PoiSummary extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final double padding;
  final double radius;

  const PoiSummary(
      {Key? key,
      required this.backgroundColor,
      required this.icon,
      required this.iconSize,
      required this.padding,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Icon(
          icon,
          size: iconSize,
          color: YahaColors.background,
        ),
      ),
    );
  }
}
