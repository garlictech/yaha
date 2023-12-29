import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaflet_map_controller.g.dart';

class LeafletMapState {
  final Location? mapCenter;
  MapController? mapController;

  LeafletMapState({this.mapCenter, this.mapController});
}

@riverpod
class LeafletMapController extends _$LeafletMapController {
  @override
  LeafletMapState build() {
    return LeafletMapState();
  }

  setMapCenter(Location newCenter) {
    state = LeafletMapState(
        mapCenter: newCenter, mapController: state.mapController);
    _setCenter();
  }

  setMapController(MapController ctr) {
    state = LeafletMapState(mapCenter: state.mapCenter, mapController: ctr);
  }

  _setCenter() {
    final mapCtr = state.mapCenter;
    final mapController = state.mapController;

    if (mapController != null && mapCtr != null) {
      mapController.move(LatLng(mapCtr.lat, mapCtr.lon), mapController.zoom);
    }
  }
}
