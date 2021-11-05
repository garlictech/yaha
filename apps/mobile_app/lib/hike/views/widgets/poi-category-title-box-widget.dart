import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class PoiCategoryTitleBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconBottomPadding;
  final Color backgroundColor;

  const PoiCategoryTitleBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconBottomPadding,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: YahaSpaceSizes.general),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: YahaSpaceSizes.small, bottom: iconBottomPadding),
            child: Icon(
              icon,
              size: YahaIconSizes.large,
              color: YahaColors.background,
            ),
          ),
          Text(title,
              style: TextStyle(
                  fontSize: YahaFontSizes.medium,
                  fontWeight: FontWeight.w600,
                  color: YahaColors.background)),
        ],
      ),
      decoration: BoxDecoration(color: backgroundColor),
      height: YahaBoxSizes.categoryTitleBoxHeight,
    );
  }
}
