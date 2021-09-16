import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'poi.dart';

const List<Object> defaultPoiPreviewList = [
  Poi(
    backgroundColor: YahaColors.military,
    icon: Icons.museum_rounded,
    iconSize: 24,
    padding: YahaSpaceSizes.xSmall,
  ),
  SizedBox(),
  Poi(
    backgroundColor: YahaColors.amenity,
    icon: Icons.fastfood_rounded,
    iconSize: 24,
    padding: YahaSpaceSizes.xSmall,
  ),
  SizedBox(),
  Poi(
    backgroundColor: YahaColors.amenity,
    icon: Icons.shopping_cart_rounded,
    iconSize: 24,
    padding: YahaSpaceSizes.xSmall,
  ),
  SizedBox(),
  Poi(
    backgroundColor: YahaColors.natural,
    icon: Icons.park_rounded,
    iconSize: 24,
    padding: YahaSpaceSizes.xSmall,
  ),
];

class CheckpointPoiListPreview extends StatelessWidget {
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
        );
      } else if (node is SizedBox) {
        return SizedBox(width: 10.0);
      }
      else {
        throw "Wrong data";
      }
    });

    return Row(
      children: [...nodes],
    );
  }
}
