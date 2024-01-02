import 'package:flutter_map/flutter_map.dart';
import 'package:functional_data/functional_data.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_entity.dart';

part 'places_on_route_map_state.g.dart';

@FunctionalData()
class PlacesOnRouteMapState extends $PlacesOnRouteMapState {
  @override
  final List<PoiEntity>? offroutePois;
  @override
  final HikeEntity? hike;
  @override
  final List<Marker>? globalMarkers;
  @override
  final List<Marker>? distanceMarkers;
  @override
  final LatLngBounds? mapBounds;
  @override
  final bool isMapOnly;
  @override
  final bool isPoifilterOn;
  @override
  final bool isOffroutePoisShown;
  @override
  final String? tappedOffroutePoiIcon;

  List<Marker> get allMarkers {
    return [...(globalMarkers ?? []), ...(distanceMarkers ?? [])];
  }

  PlacesOnRouteMapState(
      {this.offroutePois,
      this.hike,
      this.globalMarkers,
      this.distanceMarkers,
      this.mapBounds,
      this.isMapOnly = false,
      this.isPoifilterOn = false,
      this.isOffroutePoisShown = false,
      this.tappedOffroutePoiIcon});
}
