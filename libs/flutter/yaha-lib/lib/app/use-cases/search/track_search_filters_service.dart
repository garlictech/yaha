import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_search_filters_service.g.dart';

@riverpod
class TrackSearchFiltersService extends _$TrackSearchFiltersService {
  @override
  TrackSearchFilters build() {
    return TrackSearchFilters();
  }

  updateLength(double newLenghtMinState, double newLengthMaxState) =>
      state = state.copyWith(
          lengthMin: newLenghtMinState, lengthMax: newLengthMaxState);

  updateDuration(double newDurationMinState, double newDurationMaxState) =>
      state = state.copyWith(
          durationMin: newDurationMinState, durationMax: newDurationMaxState);

  updateSearchRadius(int newState) =>
      state = state.copyWith(searchRadius: newState);

  updateDifficulty(int newState, int index) =>
      state = state.copyWith(difficulty: newState, difficultyIndex: index);

  updateOrigin(GeoPoint newOrigin) => state = state.copyWith(origin: newOrigin);

  updateHits(List<String> newHits) => state = state.copyWith(hits: newHits);
}
