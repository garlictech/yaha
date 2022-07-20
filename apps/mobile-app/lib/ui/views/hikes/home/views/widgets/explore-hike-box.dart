import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class ExploreHikeBox extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Widget onPressed;

  const ExploreHikeBox({
    Key? key,
    required this.topTitle,
    required this.bottomTitle,
    required this.onPressed,
  }) : super(key: key);

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
                  child: const Text(
                    'Explore hikes',
                    style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => onPressed));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: YahaColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(YahaBorderRadius.general))),
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
