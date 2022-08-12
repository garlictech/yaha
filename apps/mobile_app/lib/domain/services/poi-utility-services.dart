import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/hike-providers.dart';
import '/app/poi-providers.dart';

import '../entities/entities.dart';

class PoiUtilityServices {
  final ProviderReference ref;

  PoiUtilityServices({required this.ref});

  Stream<List<PoiOfHike>> getPoisOfHike(
      String hikeId, double distanceInMeters) async* {
    final poiRepo = ref.read(poiRepositoryProvider);
    final hike = await ref.read(hikeProvider(hikeId).future);

    var poiChunks = poiRepo.searchPoisAroundHike(SearchAroundHikeInput(
        objectType: 'poi', hikeId: hikeId, distanceInMeters: distanceInMeters));

    await for (final pois in poiChunks) {
      final futureGroup = FutureGroup<Poi?>();
      fv(r) => futureGroup.add(poiRepo.getPoi(r));
      pois.forEach(fv);
      futureGroup.close();
      yield await futureGroup.future.then((pois) => pois
          .whereType<Poi>()
          .map((poi) => PoiOfHike(poi: poi, hike: hike, ref: ref))
          .toList());
    }
  }
}

final poiUtilityServicesProvider =
    Provider<PoiUtilityServices>((ref) => PoiUtilityServices(ref: ref));
