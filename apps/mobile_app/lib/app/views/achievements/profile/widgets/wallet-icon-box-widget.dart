import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';

class WalletIconBox extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double borderRadius;

  const WalletIconBox({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: YahaColors.accentColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
