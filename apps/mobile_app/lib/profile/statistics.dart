import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: YahaColors.tertiaryAccentColor,
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
        ),
        child: Container(
          margin: const EdgeInsets.all(YahaSpaceSizes.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('34',
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
              VerticalDivider(color: YahaColors.divider, thickness: 2),
              Column(
                children: [
                  Text('370',
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
              VerticalDivider(color: YahaColors.divider, thickness: 2),
              Column(
                children: [
                  Text('54',
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
