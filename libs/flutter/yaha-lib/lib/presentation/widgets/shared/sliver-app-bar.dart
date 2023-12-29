import 'package:flutter/material.dart';

import 'shared.dart';

class YahaSliverAppBar extends StatelessWidget {
  final String title;
  final Widget content;

  const YahaSliverAppBar(
      {required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      stretch: false,
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 240.0,
      backgroundColor: YahaColors.background,
      leading: const YahaBackButton(),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double appBarHeight = constraints.biggest.height;
          bool isExpanded = appBarHeight > height * 0.2;
          double opacity = isExpanded ? 0.4 : 0;

          final textColor = isExpanded ? YahaColors.background : Colors.black;

          return FlexibleSpaceBar(
            titlePadding: isExpanded
                ? const EdgeInsets.only(
                    left: YahaSpaceSizes.general,
                    bottom: YahaSpaceSizes.small,
                    right: YahaSpaceSizes.general)
                : null,
            centerTitle: isExpanded ? false : true,
            title: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.4),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(opacity),
                        borderRadius:
                            BorderRadius.circular(YahaBorderRadius.xxSmall)),
                    //padding: const EdgeInsets.all(YahaSpaceSizes.xxSmall),
                    child: YahaScreenHeadTitleText(
                        text: title, color: textColor, expanded: isExpanded))),
            background: content,
          );
        },
      ),
    );
  }
}
