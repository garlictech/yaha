import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/providers.dart';
import 'package:yaha/utils/failure.dart';

import '../entities/entities.dart';

class HikeSearchUsecases {
  final ProviderReference ref;

  HikeSearchUsecases({required this.ref});

  Future<Either<Failure, List<Hike>>> searchHikesAround() {
    return ref
        .read(geoLocationRepositoryProvider)
        .getCurrentLocation()
        .then((_currentLocation) => ref.read(hikeRepository).getHikeList());
  }
}
