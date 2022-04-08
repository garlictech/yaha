import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class PoiFilters extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;

  const PoiFilters({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Container(
        padding: const EdgeInsets.only(left: YahaSpaceSizes.xSmall),
        child: Text(
          title,
          style: const TextStyle(
            color: YahaColors.background,
            fontSize: YahaFontSizes.xSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      avatar: Icon(
        icon,
        color: YahaColors.background,
        size: 28.0,
      ),
      padding: const EdgeInsets.only(left: YahaSpaceSizes.xSmall),
      labelPadding: const EdgeInsets.only(
        top: YahaSpaceSizes.xxSmall,
        right: YahaSpaceSizes.medium,
        bottom: YahaSpaceSizes.xxSmall,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
      ),
    );
  }
}
