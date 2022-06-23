import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:async/async.dart';

import '../entities/entities.dart';

class HikeSearchUsecases {
  final Ref ref;

  HikeSearchUsecases({required this.ref});

  Future<List<Hike>> searchHikesAround() {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation().then(
        (currentLocation) => searchHikesAroundLocation(
            Location(
                lat: currentLocation.latitude, lon: currentLocation.longitude),
            50000,
            10));
  }

  Future<List<Hike>> searchHikesAroundLocation(
      Location origin, double radiusInMeters, int? limit) {
    final hikeRepo = ref.read(hikeRepositoryProvider);

    return hikeRepo
        .searchHikeByRadius(SearchHikeByRadiusInput(
            location: origin, radiusInMeters: radiusInMeters, limit: limit))
        .then((hikeIds) {
      final futureGroup = FutureGroup<Hike>();
      fv(r) => futureGroup.add(hikeRepo.getHike(r));
      hikeIds.forEach(fv);
      futureGroup.close();
      return futureGroup.future;
    });
  }
}
