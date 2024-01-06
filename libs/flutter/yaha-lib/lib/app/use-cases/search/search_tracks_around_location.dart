import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_tracks_around_location.g.dart';

@riverpod
class SearchTracksAroundLocationUsecase
    extends _$SearchTracksAroundLocationUsecase {
  @override
  FutureOr<void> build() {}

  Future<List<String>> execute(GeoPoint origin, int radiusInMeters) async {
    final trackRepository = ref.read(trackRepositoryProvider);
    return trackRepository.searchTrackByRadius(
        SearchByRadiusInput(origin: origin, radiusInMeters: radiusInMeters));
  }
}
