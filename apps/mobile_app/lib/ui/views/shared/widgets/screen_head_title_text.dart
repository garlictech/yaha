import 'package:flutter/material.dart';

import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';

class YahaScreenHeadTitleText extends StatelessWidget {
  final String text;
  final Color color;

  const YahaScreenHeadTitleText(
      {required this.text, this.color = YahaColors.textColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: YahaFontSizes.medium,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
