import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_tracks_around_location.dart';

part 'search_tracks_around_current_location.g.dart';

@riverpod
class SearchTracksAroundCurrentLocationUseCase
    extends _$SearchTracksAroundCurrentLocationUseCase {
  @override
  FutureOr<void> build() {}

  Future<List<String>> execute() async {
    final currentLocation =
        await ref.read(geoLocationRepositoryProvider).getCurrentLocation();

    final searchOrigin = GeoPoint(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        height: 0);

    final radius = ref.read(defaultsProvider).searchRadiusInMeters;

    return ref
        .read(searchTracksAroundLocationUsecaseProvider.notifier)
        .execute(searchOrigin, radius);
  }
}
