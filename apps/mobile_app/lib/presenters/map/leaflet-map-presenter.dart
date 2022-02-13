import 'package:flutter/foundation.dart';
import 'package:geojson/geojson.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/entities/shared/geojson.dart';
import 'package:yaha/externals/map_controller/src/controller.dart';
import 'package:flutter_map/flutter_map.dart';

class LeafletMapPresenter extends ChangeNotifier {
  final MapController mapController;
  late final StatefulMapController statefulMapController;

  LeafletMapPresenter() : mapController = MapController() {
    statefulMapController =
        StatefulMapController(mapController: mapController, verbose: true);
  }

  addHikeTrack(GeoJsonData track) async {
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
        "coordinates": [-104.99404, 39.75621]
    }
        }]
    }''';

    final geojson = GeoJson();
    await geojson.parse(geojsonFeature, verbose: true);

    statefulMapController.onReady.then((_) {
      return statefulMapController.fromGeoJson(geojsonFeature);
    }).then((_) => notifyListeners());
    statefulMapController.changeFeed.listen((change) {});
  }
}

final leafletMapMVPProvider =
    ChangeNotifierProvider.autoDispose<LeafletMapPresenter>(
        (ref) => LeafletMapPresenter());
