import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/data/data.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import 'use-case-providers.dart';

final hikeRepositoryProvider = Provider<HikeRepository>(
  (ref) => HikeRepositoryNeo4j(ref: ref),
);

final bestHikesNearbyProvider = FutureProvider<List<String>>((ref) async {
  return ref.read(hikeSearchUsecasesProvider).searchHikesAround();
});

final bestHikesOfTheWorldProvider = FutureProvider<List<String>>((ref) async {
  return ref.read(hikeRepositoryProvider).getRandomHikes(10);
});
