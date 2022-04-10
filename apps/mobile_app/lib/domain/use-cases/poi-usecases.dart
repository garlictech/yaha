import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/providers.dart';
import 'package:async/async.dart';
import '../entities/entities.dart';

abstract class PoiUsecases {
  Future<List<Poi>> getPoisAlongHike(String hikeId);
  Future<List<Poi>> getPoisAroundHike(String hikeId);
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

  _getPoisOfHike(String hikeId, double distanceInMeters) {
    final poiRepo = ref.read(poiRepositoryProvider);

    return poiRepo
        .searchPoisAroundHike(SearchAroundHikeInput(
            objectType: 'poi',
            hikeId: hikeId,
            distanceInMeters: distanceInMeters))
        .then((res) {
      final futureGroup = FutureGroup<Poi>();
      fv(r) => futureGroup.add(poiRepo.getPoi(r));
      res.forEach(fv);
      futureGroup.close();
      return futureGroup.future;
    });
  }
}
