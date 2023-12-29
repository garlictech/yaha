import 'package:flutter/material.dart';

import 'shared.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: YahaSpaceSizes.xLarge,
          bottom: YahaSpaceSizes.small,
          left: YahaSpaceSizes.small),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
