import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class WeatherColumnTile extends StatelessWidget {
  final String day;
  final String icon;
  final String maxDegree;
  final String minDegree;

  const WeatherColumnTile({
    Key? key,
    required this.day,
    required this.icon,
    required this.maxDegree,
    required this.minDegree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              day,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  color: YahaColors.textColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              icon,
              width: YahaIconSizes.small,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: YahaColors.textColor,
                  fontSize: YahaFontSizes.small,
                ),
                children: [
                  TextSpan(
                    text: maxDegree + ' | ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: minDegree,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
