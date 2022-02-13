import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/entities/entities.dart';
import 'package:yaha/externals/map_controller/src/controller.dart';
import 'package:flutter_map/flutter_map.dart';

class LeafletMapPresenter extends ChangeNotifier {
  final MapController mapController;
  late final StatefulMapController statefulMapController;

  LeafletMapPresenter() : mapController = MapController() {
    statefulMapController =
        StatefulMapController(mapController: mapController, verbose: true);
  }

  addHikeTrack(LineStringData track) async {
    const name = 'name';

    return statefulMapController.onReady
        .then((_) => statefulMapController
            .fromGeoJson(track.toGeojsonFeatureString(name), verbose: true))
        .then((_) => addPoi(track.coordinates[0][0], track.coordinates[0][1]))
        .then((_) => statefulMapController.centerOnPoint(
            LatLng(track.coordinates[0][1], track.coordinates[0][0])))
        .then((_) => notifyListeners());
  }

  addPoi(double longitude, double latitude) async {
    var geojsonFeature = '''{
"features": [
    {
    "type": "Feature",
    "properties": {
        "name": "Coors Field",
        "amenity": "Baseball Stadium",
        "popupContent": "This is where the Rockies play!"
    },
    "geometry": {
        "type": "Point",
        "coordinates": [$longitude, $latitude]
    }
        }]
    }''';
    return statefulMapController.onReady
        .then((_) => statefulMapController.fromGeoJson(geojsonFeature))
        .then((_) => notifyListeners());
  }
}

final leafletMapMVPProvider =
    ChangeNotifierProvider.autoDispose<LeafletMapPresenter>(
        (ref) => LeafletMapPresenter());
