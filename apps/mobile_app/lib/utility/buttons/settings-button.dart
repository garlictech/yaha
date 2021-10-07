import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.settings_outlined,
        size: 28.0,
        color: YahaColors.textColor,
      ),
    );
  }
}
