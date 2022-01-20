import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class Statistics extends StatelessWidget {
  final int hikes;
  final int km;
  final int hours;

  const Statistics({
    Key? key,
    required this.hikes,
    required this.km,
    required this.hours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: YahaBoxSizes.heightXXSmall,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: YahaColors.accentColor,
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
        ),
        child: Container(
          margin: const EdgeInsets.all(YahaSpaceSizes.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(hikes.toString(),
                      style: TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text('hikes',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                children: [
                  Text(km.toString(),
                      style: TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text('km',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                children: [
                  Text(hours.toString(),
                      style: TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text('hours',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
