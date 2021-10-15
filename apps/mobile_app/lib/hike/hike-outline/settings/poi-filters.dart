import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

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
        padding: EdgeInsets.only(left: YahaSpaceSizes.xSmall),
        child: Text(
          title,
          style: TextStyle(
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
      padding: EdgeInsets.only(left: YahaSpaceSizes.xSmall),
      labelPadding: EdgeInsets.only(
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
