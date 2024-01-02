import 'package:flutter_yaha_lib/app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'distance_markers.dart';
import 'places_on_route_map_state.dart';
import 'utils/utils.dart';

part 'places_on_route_map_controller.g.dart';

@riverpod
class PlacesOnRouteMapController extends _$PlacesOnRouteMapController {
  @override
  Future<PlacesOnRouteMapState> build(String hikeId) async {
    final hike = await ref.watch(createConfiguredHikeProvider(hikeId).future);
    final globalMarkers = await ref.watch(globalMarkersProvider.future);
    final distanceMarkers =
        await ref.watch(distanceMarkersProvider(hikeId).future);
    final offroutePois =
        await ref.watch(filteredPoisAroundHikeProvider(hikeId).future);

    final bounds = hike.bounds;

    return PlacesOnRouteMapState(
        hike: hike,
        mapBounds: bounds,
        globalMarkers: globalMarkers,
        distanceMarkers: distanceMarkers,
        offroutePois: offroutePois);
  }

  toggleOffroutePois() {
    ref
        .read(hikingSettingsServiceProvider(hikeId).notifier)
        .togglePoisAroundHike();
  }

  onMapOnlyPressed() async {
    final value = await future;
    final newValue = value.copyWith(isMapOnly: !value.isMapOnly);
    state = AsyncValue.data(newValue);
  }

  onPoiFilterPressed() async {
    final value = await future;
    final newValue = value.copyWith(isPoifilterOn: true);
    state = AsyncValue.data(newValue);
  }

  onPoiFilterCloseTapped() async {
    final value = await future;
    final newValue = value.copyWith(isPoifilterOn: false);
    state = AsyncValue.data(newValue);
  }

  onOffroutePoiIconTapped(String poiId) async {
    final value = await future;
    final newValue = value.copyWith(tappedOffroutePoiIcon: poiId);
    state = AsyncValue.data(newValue);
  }

  hideAllModals() async {
    final value = await future;
    final newValue = value.copyWith(tappedOffroutePoiIcon: null);
    state = AsyncValue.data(newValue);
  }
}
