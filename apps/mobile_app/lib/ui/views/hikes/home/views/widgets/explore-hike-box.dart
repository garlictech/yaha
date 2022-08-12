import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../shared/shared.dart';

class ExploreHikeBox extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final PersistentTabController tabController;

  const ExploreHikeBox(
      {Key? key,
      required this.topTitle,
      required this.bottomTitle,
      required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              top: YahaSpaceSizes.xLarge,
              right: YahaSpaceSizes.general,
              bottom: YahaSpaceSizes.xLarge,
              left: YahaSpaceSizes.general),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(YahaBorderRadius.general),
            color: YahaColors.accentColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                topTitle,
                style: const TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.general),
                child: Text(
                  bottomTitle,
                  style: const TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.w600,
                      color: YahaColors.textColor),
                ),
              ),
              SizedBox(
                width: YahaBoxSizes.buttonWidthBig,
                height: YahaBoxSizes.buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    tabController.jumpToTab(1);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: YahaColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(YahaBorderRadius.general))),
                  ),
                  child: const Text(
                    'Explore hikes',
                    style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
