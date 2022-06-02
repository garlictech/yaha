import 'package:flutter/material.dart';

import '../yaha-border-radius.dart';
import '../yaha-box-sizes.dart';
import '../yaha-font-sizes.dart';

class YahaCtaBig extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;

  const YahaCtaBig({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: YahaBoxSizes.buttonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
              fontSize: YahaFontSizes.small,
              fontWeight: FontWeight.w600,
              color: titleColor),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(YahaBorderRadius.general),
            ),
          ),
        ),
      ),
    );
  }
}
