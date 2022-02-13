import 'package:flutter/material.dart';
import 'package:yaha/entities/poi/poi.dart';
import 'package:yaha/hike/hike-outline/poi-summary.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

const List<Object> defaultPoiPreviewList = [
  PoiSummary(
    backgroundColor: YahaColors.generic,
    icon: Icons.museum_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
  SizedBox(),
  PoiSummary(
    backgroundColor: YahaColors.amenity,
    icon: Icons.fastfood_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
  SizedBox(),
  PoiSummary(
    backgroundColor: YahaColors.amenity,
    icon: Icons.shopping_cart_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
  SizedBox(),
  PoiSummary(
    backgroundColor: YahaColors.natural,
    icon: Icons.park_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),
];

class CheckpointPoiListPreview extends StatelessWidget {
  const CheckpointPoiListPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //_createMainWidget() {
    var nodes = defaultPoiPreviewList.map<Widget>((node) {
      if (node is PoiSummary) {
        return node;
      } else if (node is SizedBox) {
        return const SizedBox(width: 10.0);
      } else {
        throw "Wrong data";
      }
    });

    return Row(
      children: [...nodes],
    );
  }
}
