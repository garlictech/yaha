import 'package:flutter/material.dart';

import '../yaha-colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.settings_outlined,
        size: 28.0,
        color: YahaColors.textColor,
      ),
    );
  }
}
