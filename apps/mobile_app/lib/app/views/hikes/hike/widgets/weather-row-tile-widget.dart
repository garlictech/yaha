import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class WeatherRowTile extends StatelessWidget {
  final String time;
  final String icon;
  final String degree;

  const WeatherRowTile({
    Key? key,
    required this.time,
    required this.icon,
    required this.degree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
              fontSize: YahaFontSizes.small,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: YahaSpaceSizes.small,
            bottom: YahaSpaceSizes.small,
          ),
          child: Image.asset(
            icon,
            width: YahaIconSizes.small,
          ),
        ),
        Text(
          degree,
          style: const TextStyle(
              fontSize: YahaFontSizes.small,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
