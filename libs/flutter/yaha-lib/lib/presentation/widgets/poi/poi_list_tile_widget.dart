import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/app/utils/units.dart';

import '../../screens/poi_info_screen.dart';
import 'poi-icon.dart';
import '../shared/shared.dart';

class PoiListTileWidget extends StatelessWidget {
  final PoiEntity poi;
  final HikeEntity hike;
  final String title;
  final double distanceFromStart;

  const PoiListTileWidget({
    super.key,
    required this.poi,
    required this.hike,
    required this.title,
    required this.distanceFromStart,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PoiInfoScreen(poi: poi, hike: hike)));
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
                SizedBox(
                    height: 40,
                    width: 40,
                    child: PoiIcon(poiType: poi.poiType)),
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
                        'Distance from start: ${getDistanceString(distanceFromStart)}',
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
