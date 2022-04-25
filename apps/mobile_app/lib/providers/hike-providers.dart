import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';

import 'use-case-providers.dart';

final hikeRepositoryProvider = Provider<HikeRepository>(
  (ref) => HikeRepositoryAmplify(),
);

final bestHikesNearbyProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.read(hikeSearchUsecasesProvider).searchHikesAround();
});

final bestHikesOfTheWorldProvider = FutureProvider<List<Hike>>((ref) async {
  return ref.read(hikeRepositoryProvider).getHikeList();
});
