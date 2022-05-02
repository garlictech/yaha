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
    double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      stretch: false,
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 240.0,
      backgroundColor: YahaColors.primary,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double appBarHeight = constraints.biggest.height;
          bool isExpanded = appBarHeight > height * 0.2;
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(
                left: YahaSpaceSizes.general,
                bottom: YahaSpaceSizes.small,
                right: YahaSpaceSizes.general),
            centerTitle: isExpanded ? false : true,
            title: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.5),
              child: Text(
                title,
                style: const TextStyle(
                    color: YahaColors.background,
                    fontWeight: FontWeight.w700,
                    fontSize: YahaFontSizes.small),
              ),
            ),
            background: content,
          );
        },
      ),
    );
  }
}
