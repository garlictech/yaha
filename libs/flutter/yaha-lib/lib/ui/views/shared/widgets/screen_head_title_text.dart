import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    return AutoSizeText(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: expanded ? YahaFontSizes.medium : YahaFontSizes.small,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
