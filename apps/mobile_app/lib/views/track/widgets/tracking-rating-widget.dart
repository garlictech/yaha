import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
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
        ],
      ),
    );
  }
}
