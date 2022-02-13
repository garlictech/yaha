import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-outline/poi-summary.dart';
import 'package:yaha/hike/views/screens/poi-screen.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class PoiListTileWidget extends StatelessWidget {
  final Color poiColor;
  final IconData poiIcon;
  final String title;
  final int? distanceFromStart;

  const PoiListTileWidget({
    Key? key,
    required this.poiColor,
    required this.poiIcon,
    required this.title,
    required this.distanceFromStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PoiScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PoiSummary(
                  backgroundColor: poiColor,
                  icon: poiIcon,
                  iconSize: YahaIconSizes.small,
                  padding: YahaSpaceSizes.xSmall,
                  radius: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.xSmall),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: YahaFontSizes.small,
                            color: YahaColors.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Distance from start: ${distanceFromStart}m',
                        style: const TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: YahaIconSizes.medium,
              color: YahaColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
