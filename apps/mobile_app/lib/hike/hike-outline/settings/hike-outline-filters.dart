import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HikeOutlineFilters extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      padding: EdgeInsets.only(
        top: YahaSpaceSizes.large,
        right: YahaSpaceSizes.general,
        bottom: YahaSpaceSizes.large,
        left: YahaSpaceSizes.general,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Show POIs between checkpoints',
                style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  color: YahaColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: YahaSpaceSizes.general,
              bottom: YahaSpaceSizes.general,
            ),
            child: Row(
              children: [
                Text(
                  'Show natural phenomenons',
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    color: YahaColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.help_rounded),
                    color: YahaColors.primary,
                    iconSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'POI categories',
                style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  color: YahaColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_rounded),
                  color: YahaColors.primary,
                  iconSize: 28.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
