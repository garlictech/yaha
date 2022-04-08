import 'package:flutter/material.dart';

import '../../shared/shared.dart';

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
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  const Text('hikes',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              const VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                children: [
                  Text(km.toString(),
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  const Text('km',
                      style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              const VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                children: [
                  Text(hours.toString(),
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  const Text('hours',
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
