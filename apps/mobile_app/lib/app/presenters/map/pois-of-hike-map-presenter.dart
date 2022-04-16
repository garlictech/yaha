import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/externals/map_controller/src/controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:async/async.dart';

class PoisOfHikeMapPresenter extends ChangeNotifier {
  final MapController mapController;
  late final StatefulMapController statefulMapController;
  final List<PoiOfHike> pois;

  PoisOfHikeMapPresenter({required this.pois})
      : mapController = MapController() {
    statefulMapController =
        StatefulMapController(mapController: mapController, verbose: true);
    //addPois();
    addHikeTrack();
  }

  addHikeTrack() async {
    const name = 'name';
    final track = pois.first.hike.route;

    return statefulMapController
        .fromGeoJson(track.toGeojsonFeatureString(name), verbose: true)
        .then((_) => statefulMapController.centerOnPoint(
            LatLng(track.coordinates[0][1], track.coordinates[0][0])))
        .then((_) => notifyListeners());
  }

  addPois() async {
    debugPrint("ADD POIS");
    final futureGroup = FutureGroup<void>();
    for (var poi in pois.take(2)) {
      final feature = '''{
      "features": [{
        "type": "Feature",
        "properties": {
            "name": "${poi.title}",
            "amenity": "${poi.poiType.kind}",
            "popupContent": "${poi.title}"
        },
        "geometry": {
            "type": "Point",
            "coordinates": [${poi.location.lon}, ${poi.location.lat}]
        }
      }]
      }''';

      futureGroup.add(statefulMapController.fromGeoJson(feature));
    }
    futureGroup.close();

    return futureGroup.future.then((_) {
      debugPrint("NOFIFY POIS");
      notifyListeners();
    });
  }
}

final poisOfHikeMapProvider = ChangeNotifierProvider.autoDispose
    .family<PoisOfHikeMapPresenter, List<PoiOfHike>>(
        (ref, pois) => PoisOfHikeMapPresenter(pois: pois));
