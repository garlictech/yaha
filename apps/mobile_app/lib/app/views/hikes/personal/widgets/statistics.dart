import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class Statistics extends StatelessWidget {
  final int leftNumber;
  final int middleNumber;
  final int rightNumber;
  final String leftName;
  final String middleName;
  final String rightName;

  const Statistics({
    Key? key,
    required this.leftNumber,
    required this.middleNumber,
    required this.rightNumber,
    required this.leftName,
    required this.middleName,
    required this.rightName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: YahaColors.accentColor,
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
        ),
        child: Container(
          margin: const EdgeInsets.all(YahaSpaceSizes.xSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(leftNumber.toString(),
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text(leftName,
                      style: const TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              const VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(middleNumber.toString(),
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text(middleName,
                      style: const TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w400,
                          color: YahaColors.textColor)),
                ],
              ),
              const VerticalDivider(
                  color: YahaColors.divider, thickness: YahaBorderWidth.small),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rightNumber.toString(),
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor)),
                  Text(rightName,
                      style: const TextStyle(
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
