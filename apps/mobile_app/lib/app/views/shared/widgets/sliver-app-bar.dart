import 'package:flutter/material.dart';

import '../shared.dart';

class YahaSliverAppBar extends StatelessWidget {
  final String title;
  //final String imageUrl;
  final Widget content;

  const YahaSliverAppBar({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: false,
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 240.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
            left: YahaSpaceSizes.general, bottom: YahaSpaceSizes.small),
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: YahaColors.background,
                      fontWeight: FontWeight.w700,
                      fontSize: YahaFontSizes.small),
                ),
              ],
            ),
          ],
        ),
        background: content,
      ),
    );
  }
}
