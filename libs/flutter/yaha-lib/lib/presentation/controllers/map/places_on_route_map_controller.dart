import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:functional_data/functional_data.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_entity.dart';

part 'places_on_route_map_controller.g.dart';

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
  final bool showLoader;
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
      this.showLoader = true,
      this.isMapOnly = false,
      this.isPoifilterOn = false,
      this.isOffroutePoisShown = false,
      this.tappedOffroutePoiIcon});
}

@riverpod
class PlacesOnRouteMapController extends _$PlacesOnRouteMapController {
  @override
  PlacesOnRouteMapState build(String hikeId) {
    final hikeWithBounds = ref.watch(hikeWithBoundsProvider(hikeId));
    final globalMarkers = ref.watch(globalMarkersProvider);
    final distanceMarkers = ref.watch(distanceMarkersProvider(hikeId));
    final offroutePois = ref.watch(filteredPoisAroundHikeProvider(hikeId));

    if (hikeWithBounds == null ||
        globalMarkers == null ||
        distanceMarkers == null ||
        offroutePois.loading) {
      return PlacesOnRouteMapState(showLoader: true);
    }

    final hike = hikeWithBounds.value1;
    final bounds = hikeWithBounds.value2;
    final pois = offroutePois.data ?? [];

    return PlacesOnRouteMapState(
        hike: hike,
        mapBounds: bounds,
        globalMarkers: globalMarkers,
        distanceMarkers: distanceMarkers,
        offroutePois: pois,
        showLoader: false);
  }

  toggleOffroutePois() {
    ref
        .read(hikingSettingsServiceProvider(hikeId).notifier)
        .togglePoisAroundHike();
  }

  onMapOnlyPressed() {
    state = state.copyWith(isMapOnly: !state.isMapOnly);
  }

  onPoiFilterPressed() {
    state = state.copyWith(isPoifilterOn: true);
  }

  onPoiFilterCloseTapped() {
    state = state.copyWith(isPoifilterOn: false);
  }

  onOffroutePoiIconTapped(String poiId) {
    state = state.copyWith(tappedOffroutePoiIcon: poiId);
  }

  hideAllModals() {
    state = state.copyWith(isPoifilterOn: false, tappedOffroutePoiIcon: null);
  }
}
