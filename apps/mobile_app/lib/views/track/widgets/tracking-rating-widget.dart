import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/track/widgets/rating-satisfaction-widget.dart';

class TrackingRatingWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.only(
          left: YahaSpaceSizes.general,
          right: YahaSpaceSizes.general,
          top: YahaSpaceSizes.general),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose a place for rating',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.small,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: YahaSpaceSizes.xLarge, top: YahaSpaceSizes.small),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: YahaBoxSizes.buttonHeight,
                constraints: BoxConstraints(maxWidth: YahaBoxSizes.maxWidth400),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: YahaBorderWidth.xSmall,
                    color: YahaColors.textColor,
                  ),
                  borderRadius: BorderRadius.circular(YahaBorderRadius.general),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(
                        Icons.expand_more,
                        size: YahaFontSizes.xxLarge,
                        color: YahaColors.textColor,
                      ),
                      style: const TextStyle(
                          color: YahaColors.textColor,
                          fontSize: YahaFontSizes.small),
                      underline: Container(
                        height: 0,
                      ),
                      items:
                          <String>['English', 'Hungarian'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            'How was the sight?',
            style: TextStyle(
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.small,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.xLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingSatisfactionWidget(
                    icon: Icons.sentiment_very_satisfied_rounded,
                    backgroundColor: YahaColors.primary),
                RatingSatisfactionWidget(
                    icon: Icons.sentiment_satisfied_rounded,
                    backgroundColor: YahaColors.lightGreen),
                RatingSatisfactionWidget(
                    icon: Icons.sentiment_neutral_rounded,
                    backgroundColor: YahaColors.warning),
                RatingSatisfactionWidget(
                    icon: Icons.sentiment_dissatisfied_rounded,
                    backgroundColor: YahaColors.amenity),
                RatingSatisfactionWidget(
                    icon: Icons.sentiment_very_dissatisfied_rounded,
                    backgroundColor: YahaColors.error),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: YahaSpaceSizes.small),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Do you want to add some pictures?',
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: YahaBoxSizes.heightGeneral,
                color: YahaColors.grey200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_rounded,
                      size: YahaIconSizes.uploadIcon,
                      color: YahaColors.accentColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: YahaSpaceSizes.semiLarge, top: YahaSpaceSizes.xLarge),
              child: SizedBox(
                height: YahaBoxSizes.buttonHeight,
                width: YahaBoxSizes.buttonWidthBig,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.send_rounded,
                    color: YahaColors.accentColor,
                    size: YahaFontSizes.large,
                  ),
                  onPressed: () {},
                  label: Text('Send',
                      style: TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w600,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: YahaColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(YahaBorderRadius.general))),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
