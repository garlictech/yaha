import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';

import '../../entities/entities.dart';

class HikeSearchUsecases {
  final Ref ref;

  HikeSearchUsecases({required this.ref});

  Future<List<String>> searchHikesAround() {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation().then(
        (currentLocation) => ref
            .read(hikeRepositoryProvider)
            .searchHikeByRadius(SearchByRadiusInput(
                origin: Point(
                    latitude: currentLocation.latitude,
                    longitude: currentLocation.longitude,
                    height: 0),
                radiusInMeters:
                    ref.read(defaultsProvider).searchRadiusInMeters)));
  }
}
