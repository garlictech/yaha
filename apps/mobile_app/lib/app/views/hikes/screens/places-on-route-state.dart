import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import 'poi-list-tile-widget.dart';

const List<Object> defaultNodeList = [
  PoiListTileWidget(
    poiColor: YahaColors.amenity,
    poiIcon: Icons.outlined_flag_rounded,
    title: 'Hungarian Parliament Building',
    distanceFromStart: 500,
  ),
  Padding(
    padding: EdgeInsets.only(
        top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
    child:
        Divider(color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
  ),
  PoiListTileWidget(
    poiColor: YahaColors.generic,
    poiIcon: Icons.museum,
    title: 'Hungarian National Museum',
    distanceFromStart: 700,
  ),
  Padding(
    padding: EdgeInsets.only(
        top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
    child:
        Divider(color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
  ),
  PoiListTileWidget(
    poiColor: YahaColors.amenity,
    poiIcon: Icons.pool_rounded,
    title: 'Széchenyi Thermal Bath',
    distanceFromStart: 1000,
  ),
  Padding(
    padding: EdgeInsets.only(
        top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
    child:
        Divider(color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
  ),
  PoiListTileWidget(
    poiColor: YahaColors.generic,
    poiIcon: Icons.location_city_rounded,
    title: 'Buda Castle & Castle Hill',
    distanceFromStart: 1200,
  ),
  Padding(
    padding: EdgeInsets.only(
        top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
    child:
        Divider(color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
  ),
  PoiListTileWidget(
    poiColor: YahaColors.generic,
    poiIcon: Icons.location_city_rounded,
    title: "St. Stephen's Basilica",
    distanceFromStart: 1500,
  ),
  Padding(
    padding: EdgeInsets.only(
        top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
    child:
        Divider(color: YahaColors.divider, thickness: YahaBorderWidth.xxSmall),
  ),
];

class PlacesOnRouteState {
  final List<Object> nodeList;

  PlacesOnRouteState() : nodeList = defaultNodeList;
}

class PlacesOnRouteStateNotifier extends StateNotifier<PlacesOnRouteState> {
  PlacesOnRouteStateNotifier() : super(PlacesOnRouteState());

  updateState(PlacesOnRouteState newState) => state = newState;
}

final placesOnRouteStateProvider =
    FutureProvider<PlacesOnRouteState>((ref) async {
  return PlacesOnRouteState();
});
