import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/ui/viewmodels/map/leaflet-map-viewmodel.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

class LeafletMapPresenter extends StateNotifier<LeafletMapViewmodel> {
  MapController? _mapController;
  LeafletMapPresenter() : super(LeafletMapViewmodel());

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

final leafletMapMVPProvider =
    StateNotifierProvider.autoDispose<LeafletMapPresenter, LeafletMapViewmodel>(
        (ref) => LeafletMapPresenter());
