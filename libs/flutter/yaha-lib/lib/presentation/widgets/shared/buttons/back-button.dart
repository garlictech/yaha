import 'package:flutter/material.dart';

import '../shared.dart';

class YahaBackButton extends StatelessWidget {
  const YahaBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
        margin: const EdgeInsets.all(YahaSpaceSizes.xSmall),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: YahaIconSizes.medium,
            color: Colors.white,
          ),
        ));
  }
}
