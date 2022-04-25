import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/providers.dart';

import '../entities/entities.dart';

class HikeSearchUsecases {
  final ProviderReference ref;

  HikeSearchUsecases({required this.ref});

  Future<List<Hike>> searchHikesAround() {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation().then(
        (_currentLocation) => ref.read(hikeRepositoryProvider).getHikeList());
  }
}
