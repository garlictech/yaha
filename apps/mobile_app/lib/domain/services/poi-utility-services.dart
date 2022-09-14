import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/entities.dart';

class PoiUtilityServices {
  final ProviderReference ref;

  PoiUtilityServices({required this.ref});

  Future<List<PoiOfHike>> getPoisOfHike(
      Hike hike, HikingSettings hikingSettings) {
    return Future.value(hike.route.onroutePois
        .whereType<Poi>()
        .map((poi) =>
            PoiOfHike(poi: poi, hike: hike, ref: ref, settings: hikingSettings))
        .toList());
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
