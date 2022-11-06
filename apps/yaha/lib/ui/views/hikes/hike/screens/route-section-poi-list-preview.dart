import 'package:flutter/material.dart';

const List<Object> defaultPoiPreviewList = [
/*  PoiSummary(
    backgroundColor: YahaColors.amenity,
    icon: Icons.bakery_dining_rounded,
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
  SizedBox(),
  PoiSummary(
    backgroundColor: YahaColors.amenity,
    icon: Icons.sports_bar_rounded,
    iconSize: YahaIconSizes.small,
    padding: YahaSpaceSizes.xSmall,
    radius: YahaBoxSizes.circleAvatarRadiusSmall,
  ),*/
];

class RouteSectionPoiListPreview extends StatelessWidget {
  const RouteSectionPoiListPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //_createMainWidget() {
    var nodes = defaultPoiPreviewList.map((node) {
      if (node is SizedBox) {
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
