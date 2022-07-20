import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:async/async.dart';

import '../../entities/entities.dart';

abstract class PoiUsecases {
  Stream<List<Poi>> getPoisAlongHike(String hikeId);
  Stream<List<Poi>> getPoisAroundHike(String hikeId);
}

class PoiUsecasesImpl implements PoiUsecases {
  final ProviderReference ref;

  PoiUsecasesImpl({required this.ref});

  @override
  getPoisAlongHike(String hikeId) {
    final defaults = ref.read(defaultsProvider);
    return _getPoisOfHike(hikeId, defaults.smallGeoBufferSizeInMeters);
  }

  @override
  getPoisAroundHike(String hikeId) {
    final defaults = ref.read(defaultsProvider);
    return _getPoisOfHike(hikeId, defaults.bigGeoBufferSizeInMeters);
  }

  Stream<List<Poi>> _getPoisOfHike(
      String hikeId, double distanceInMeters) async* {
    final poiRepo = ref.read(poiRepositoryProvider);

    var poiChunks = poiRepo.searchPoisAroundHike(SearchAroundHikeInput(
        objectType: 'poi', hikeId: hikeId, distanceInMeters: distanceInMeters));

    await for (final pois in poiChunks) {
      final futureGroup = FutureGroup<Poi?>();
      fv(r) => futureGroup.add(poiRepo.getPoi(r));
      pois.forEach(fv);
      futureGroup.close();
      yield await futureGroup.future
          .then((pois) => pois.whereType<Poi>().toList());
    }
  }
}
