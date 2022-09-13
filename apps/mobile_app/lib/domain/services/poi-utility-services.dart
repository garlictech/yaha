import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:async/async.dart';

import '../entities/entities.dart';
import '../use-cases/poi/poi_provider.dart';

class PoiUtilityServices {
  final ProviderReference ref;

  PoiUtilityServices({required this.ref});

  Future<List<PoiOfHike>> getPoisOfHike(
      Hike hike, HikingSettings hikingSettings) async {
    FutureGroup<Poi> group = FutureGroup<Poi>();

    for (var id in hike.route.onroutePois) {
      final poi = ref.read(poiProvider(id).future);
      group.add(poi);
    }

    group.close();
    final pois = await group.future;

    return pois
        .whereType<Poi>()
        .map((poi) =>
            PoiOfHike(poi: poi, hike: hike, ref: ref, settings: hikingSettings))
        .toList();
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
