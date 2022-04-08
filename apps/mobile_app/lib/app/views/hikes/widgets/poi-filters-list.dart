import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import 'poi-filters.dart';

const List<Object> defaultPoiFiltersList = [
  PoiFilters(
    backgroundColor: YahaColors.generic,
    icon: Icons.location_city_rounded,
    title: "Generic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.amenity,
    icon: Icons.fastfood_rounded,
    title: "Amenity",
  ),
  PoiFilters(
    backgroundColor: YahaColors.natural,
    icon: Icons.park_rounded,
    title: "Natural",
  ),
  PoiFilters(
    backgroundColor: YahaColors.emergency,
    icon: Icons.local_hospital_rounded,
    title: "Emergency",
  ),
  PoiFilters(
    backgroundColor: YahaColors.publicTransport,
    icon: Icons.commute_rounded,
    title: "Public Transport",
  ),
  PoiFilters(
    backgroundColor: YahaColors.manMade,
    icon: Icons.pan_tool_rounded,
    title: "Man Made",
  ),
  PoiFilters(
    backgroundColor: YahaColors.leisure,
    icon: Icons.deck_rounded,
    title: "Leisure",
  ),
  PoiFilters(
    backgroundColor: YahaColors.military,
    icon: Icons.military_tech_rounded,
    title: "Military",
  ),
  PoiFilters(
    backgroundColor: YahaColors.historic,
    icon: Icons.history_rounded,
    title: "Historic",
  ),
  PoiFilters(
    backgroundColor: YahaColors.tourism,
    icon: Icons.hiking_rounded,
    title: "Tourism",
  ),
];

class PoiFiltersList extends StatelessWidget {
  const PoiFiltersList({Key? key}) : super(key: key);

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

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: YahaSpaceSizes.medium,
        runSpacing: YahaSpaceSizes.xSmall,
        alignment: WrapAlignment.start,
        children: [...nodes],
      ),
    );
  }
}
