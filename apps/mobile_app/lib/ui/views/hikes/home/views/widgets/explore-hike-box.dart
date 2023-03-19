import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/providers/main_tab_controller.dart';

import '../../../../shared/shared.dart';

class ExploreHikeBox extends ConsumerWidget {
  final String topTitle;
  final String bottomTitle;

  const ExploreHikeBox({
    Key? key,
    required this.topTitle,
    required this.bottomTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.read(mainTabControllerProvider);

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
