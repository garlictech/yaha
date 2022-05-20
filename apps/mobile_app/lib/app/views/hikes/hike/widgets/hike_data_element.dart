import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class HikeDataElement extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final Color color;

  const HikeDataElement(
      {required this.title,
      required this.icon,
      required this.value,
      this.color = YahaColors.secondaryAccentColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(YahaSpaceSizes.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: YahaIconSizes.large, color: color),
          Text(value,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w600,
                  color: color)),
          Text(title,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w500,
                  color: color)),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
          border: Border.all(width: 4.0, color: color)),
    );
  }
}
