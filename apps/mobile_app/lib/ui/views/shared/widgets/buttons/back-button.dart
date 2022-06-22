import 'package:flutter/material.dart';

import '../yaha-colors.dart';
import '../yaha-icon-sizes.dart';

class YahaBackButton extends StatelessWidget {
  const YahaBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        size: YahaIconSizes.medium,
        color: YahaColors.textColor,
      ),
    );
  }
}
