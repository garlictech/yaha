import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/app/viewmodels/map/leaflet-map-viewmodel.dart';
import 'package:yaha/domain/domain.dart';

class LeafletMapPresenter extends StateNotifier<LeafletMapViewmodel> {
  MapController? _mapController;
  LeafletMapPresenter() : super(LeafletMapViewmodel());

  addHike(Hike hike) {
    addHikes([hike]);
  }

  addPoi(Poi poi) {
    addPois([poi]);
  }

  addHikes(List<Hike> hikes) {
    final center = state.mapCenter ?? hikes.first.startPoint;
    state = state.copyWith(hikes: state.hikes + hikes, mapCenter: center);
  }

  addPois(List<Poi> pois) {
    final center = state.mapCenter ?? pois.first.location;
    state = state.copyWith(pois: state.pois + pois, mapCenter: center);
  }

  replacePois(List<Poi> pois) {
    state = state.copyWith(pois: pois);
  }

  set mapCenter(Location newCenter) {
    state = state.copyWith(mapCenter: newCenter);
    _setCenter();
  }

  set mapController(MapController ctr) {
    _mapController = ctr;
  }

  _setCenter() {
    final mapCtr = state.mapCenter;
    if (_mapController != null && mapCtr != null) {
      _mapController!
          .move(LatLng(mapCtr.lat, mapCtr.lon), _mapController!.zoom);
    }
  }
}

final leafletMapMVPProvider = StateNotifierProvider.autoDispose
    .family<LeafletMapPresenter, LeafletMapViewmodel, String>(
        (ref, key) => LeafletMapPresenter());
