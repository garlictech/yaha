import 'package:flutter/material.dart';

import 'widgets/yaha-space-sizes.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

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
