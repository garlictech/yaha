import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/use-cases/hike/hike_with_bounds.dart';
import 'package:yaha/domain/use-cases/hike/hiking_settings_service.dart';
import 'package:yaha/domain/use-cases/poi/filtered_pois_around_hike.dart';
import 'package:yaha/ui/views/map/distance_markers.dart';
import 'package:yaha/ui/views/map/global_markers.dart';

import 'places_on_route_map_state.dart';

part 'places_on_route_map_controller.g.dart';

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
