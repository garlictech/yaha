import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/entities.dart';

class PoiUtilityServices {
  final ProviderReference ref;

  PoiUtilityServices({required this.ref});

  List<PoiOfHike> getPoisOfHike(
      Hike? hike, double distanceInMeters, HikingSettings hikingSettings) {
    if (hike != null) {
      return hike.route.onroutePois
          .whereType<Poi>()
          .map((poi) => PoiOfHike(
              poi: poi, hike: hike, ref: ref, settings: hikingSettings))
          .toList();
    } else {
      return const [];
    }
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
