import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';

class YahaBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 28.0,
        color: YahaColors.textColor,
      ),
    );
  }
}
