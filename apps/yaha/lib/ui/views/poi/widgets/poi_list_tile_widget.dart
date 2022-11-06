import 'package:flutter/material.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/utils/units/units.dart';

import '../../poi/widgets/poi-icon.dart';
import '../../shared/shared.dart';
import '../screens/poi_info_screen.dart';

class PoiListTileWidget extends StatelessWidget {
  final Poi poi;
  final String title;
  final double distanceFromStart;

  const PoiListTileWidget({
    Key? key,
    required this.poi,
    required this.title,
    required this.distanceFromStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PoiInfoScreen(poi: poi)));
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
                    child: PoiIcon(poiType: poi.poiType),
                    height: 40,
                    width: 40),
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
