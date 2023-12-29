import 'package:flutter/material.dart';

import '../shared/shared.dart';

class ListSectionTitleBox extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final bool iconVisibility;

  const ListSectionTitleBox({
    super.key,
    this.icon,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.iconVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: YahaSpaceSizes.general),
      decoration: BoxDecoration(color: backgroundColor),
      height: YahaBoxSizes.categoryTitleBoxHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: iconVisibility,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: YahaSpaceSizes.small, bottom: YahaSpaceSizes.xxSmall),
              child: Icon(
                icon,
                size: YahaIconSizes.large,
                color: YahaColors.background,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w600,
                color: titleColor),
          ),
        ],
      ),
    );
  }
}
