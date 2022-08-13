import 'package:flutter/material.dart';
import 'package:yaha/domain/domain.dart';

import '../../shared/shared.dart';
import '../screens/places_on_route_screen.dart';
import 'poi-icon.dart';

class PoiIconList extends StatelessWidget {
  final List<PoiType> types;
  final Hike hike;
  const PoiIconList({Key? key, required this.types, required this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = types
        .map((type) => Tooltip(
            message: type.kind.replaceAll('_', ' '),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlacesOnRouteScreen(
                                hike: hike,
                                filteredPoiTypes: [type],
                              )));
                },
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: PoiIcon(
                      poiType: type,
                    )))))
        .toList();

    return Wrap(
        direction: Axis.horizontal,
        spacing: YahaSpaceSizes.medium,
        runSpacing: YahaSpaceSizes.xSmall,
        alignment: WrapAlignment.start,
        children: children);
  }
}
