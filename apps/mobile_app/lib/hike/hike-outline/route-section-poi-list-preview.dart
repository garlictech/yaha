import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'poi.dart';

const List<Object> defaultPoiPreviewList = [
  Poi(
    backgroundColor: YahaColors.amenity,
    icon: Icons.bakery_dining_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
  SizedBox(),
  Poi(
    backgroundColor: YahaColors.natural,
    icon: Icons.park_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
  SizedBox(),
  Poi(
    backgroundColor: YahaColors.amenity,
    icon: Icons.sports_bar_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
];

class RouteSectionPoiListPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_createMainWidget() {
    var nodes = defaultPoiPreviewList.map((node) {
      if (node is Poi) {
        return Poi(
          backgroundColor: node.backgroundColor,
          icon: node.icon,
          iconSize: node.iconSize,
          padding: node.padding,
          radius: node.radius,
        );
      } else if (node is SizedBox) {
        return SizedBox(width: 10.0);
      } else {
        throw "Wrong data";
      }
    });

    return Row(
      children: [...nodes],
    );
  }
}
