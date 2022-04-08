import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/utils/failure.dart';

import 'use-case-providers.dart';

final hikeRepository = Provider<HikeRepository>(
  (ref) => HikeRepositoryAmplify(),
);

final bestHikesNearbyProvider =
    FutureProvider<Either<Failure, List<Hike>>>((ref) async {
  return ref.read(hikeSearchUsecasesProvider).searchHikesAround();
});

final bestHikesOfTheWorldProvider =
    FutureProvider<Either<Failure, List<Hike>>>((ref) async {
  return ref.read(hikeRepository).getHikeList();
});
