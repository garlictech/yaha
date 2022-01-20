import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 40.0,
          ),
          Container(
            padding: EdgeInsets.only(left: YahaSpaceSizes.small),
            child: Text(
              text,
              style: TextStyle(
                fontSize: YahaFontSizes.small,
                color: YahaColors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
