import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-outline/settings/poi-filters.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

const List<Object> defaultPoiFiltersList = [
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
];

class PoiFiltersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nodes = defaultPoiFiltersList.map((node) {
      if (node is PoiFilters) {
        return PoiFilters(
          backgroundColor: node.backgroundColor,
          icon: node.icon,
          title: node.title,
        );
      } else {
        throw "Wrong data";
      }
    });

    return Wrap(
      direction: Axis.horizontal,
      spacing: YahaSpaceSizes.medium,
      runSpacing: YahaSpaceSizes.medium,
      children: [...nodes],
    );
  }
}
