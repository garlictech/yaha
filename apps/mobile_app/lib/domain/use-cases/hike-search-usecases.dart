import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:async/async.dart';
import 'package:yaha/app/providers.dart';

import '../entities/entities.dart';
import '../repositories/hikes/hike-repository.dart';

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
      Location origin, double radiusInMeters, int? limit) async {
    final hikeRepo = ref.read(hikeRepositoryProvider);
    final hikes = await hikeRepo
        .searchHikeByRadius(SearchHikeByRadiusInput(
            location: origin, radiusInMeters: radiusInMeters, limit: limit))
        .then((ids) => _getHikeList(ids, hikeRepo));
    return hikes;
  }

  Future<List<Hike>> searchHikesByContent(String content, int? limit) async {
    final hikeRepo = ref.read(hikeRepositoryProvider);
    final hikes = await hikeRepo
        .searchHikeByContent(SearchByContentInput(
            content: content, objectType: 'hike', limit: limit))
        .then((ids) => _getHikeList(ids, hikeRepo));
    return hikes;
  }

  _getHikeList(List<String> hikeIds, HikeRepository hikeRepo) {
    final futureGroup = FutureGroup<Hike?>();
    fv(r) => futureGroup.add(hikeRepo.getHike(r));
    hikeIds.forEach(fv);
    futureGroup.close();
    return futureGroup.future.then((hikes) => hikes.whereType<Hike>().toList());
  }
}
