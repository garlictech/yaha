import 'package:flutter/material.dart';

import '../shared/shared.dart';

class WeatherAstronomicalData extends StatelessWidget {
  final String text;
  final String icon;

  const WeatherAstronomicalData({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 40.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: YahaFontSizes.small,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
