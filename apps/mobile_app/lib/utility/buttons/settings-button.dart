import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(YahaBorderRadius.small),
          child: Container(
            height: YahaBoxSizes.backButtonHeight,
            width: YahaBoxSizes.backButtonWidth,
            color: YahaColors.smallButtonsBackground,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            size: 28.0,
            color: YahaColors.textColor,
          ),
        ),
      ],
    );
  }
}
