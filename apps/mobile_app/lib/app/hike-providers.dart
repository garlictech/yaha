import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';

import 'use-case-providers.dart';

final hikeRepositoryProvider = Provider<HikeRepository>(
//  (ref) => HikeRepositoryAmplify(),
  (ref) => HikeRepositoryNeo4j(),
);

final bestHikesNearbyProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.read(hikeSearchUsecasesProvider).searchHikesAround();
});

final bestHikesOfTheWorldProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.read(hikeRepositoryProvider).getHikeList();
});

final hikeProvider = FutureProvider.family<Hike, String>((ref, hikeId) async {
  return ref.read(hikeRepositoryProvider).getHike(hikeId).then((hike) {
    if (hike == null) {
      throw Exception("Hike not found");
    }

    return hike;
  });
});
