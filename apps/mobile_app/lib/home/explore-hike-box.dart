import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class ExploreHikeBox extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;

  const ExploreHikeBox({
    Key? key,
    required this.topTitle,
    required this.bottomTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
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
                style: TextStyle(
                    fontSize: YahaFontSizes.small, color: YahaColors.textColor),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.general),
                child: Text(
                  bottomTitle,
                  style: TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.w600,
                      color: YahaColors.textColor),
                ),
              ),
              SizedBox(
                width: YahaBoxSizes.buttonWidthBig,
                height: YahaBoxSizes.buttonHeight,
                child: ElevatedButton(
                  child: Text(
                    'Explore hikes',
                    style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
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
