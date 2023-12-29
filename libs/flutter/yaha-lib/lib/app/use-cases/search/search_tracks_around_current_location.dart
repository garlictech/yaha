import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_tracks_around_location.dart';

part 'search_tracks_around_current_location.g.dart';

@riverpod
class SearchTracksAroundCurrentLocationUseCase
    extends _$SearchTracksAroundCurrentLocationUseCase {
  @override
  FutureOr<List<String>> build() {
    return _execute();
  }

  Future<void> execute() async {
    state = const AsyncLoading();
    state = await _execute();
  }

  _execute() async {
    final currentLocation =
        await ref.read(geoLocationRepositoryProvider).getCurrentLocation();

    final searchOrigin = GeoPoint(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        height: 0);

    final radius = ref.read(defaultsProvider).searchRadiusInMeters;

    await ref
        .read(searchTracksAroundLocationUsecaseProvider.notifier)
        .execute(searchOrigin, radius);

    return ref.read(searchTracksAroundLocationUsecaseProvider);
  }
}
