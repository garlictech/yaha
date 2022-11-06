import 'package:flutter/material.dart';

import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';

class YahaScreenHeadTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final bool expanded;

  const YahaScreenHeadTitleText(
      {required this.text,
      this.expanded = false,
      this.color = YahaColors.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: expanded ? 2 : 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: expanded ? YahaFontSizes.medium : YahaFontSizes.small,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
