import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/domain/domain.dart';

import '/app/providers.dart';

part 'hike_search_state.g.dart';

@FunctionalData()
class HikeSearchState extends $HikeSearchState {
  @override
  final double lengthMin;
  @override
  final double lengthMax;
  @override
  final double durationMin;
  @override
  final double durationMax;
  @override
  final int searchRadius;
  @override
  final int difficulty;
  @override
  final int difficultyIndex;
  @override
  final Point origin;
  @override
  final List<String> hits;
  @override
  final bool searching;
  @override
  final bool noHits;

  HikeSearchState(
      {this.lengthMin = 3.0,
      this.lengthMax = 10.0,
      this.durationMin = 8.0,
      this.durationMax = 10.0,
      this.searchRadius = 50000,
      this.difficulty = 1,
      this.difficultyIndex = 0,
      this.hits = const [],
      this.searching = false,
      this.noHits = false,
      this.origin = const Point(latitude: 0, longitude: 0, height: 0)});
}

class HikeSearchStateNotifier extends StateNotifier<HikeSearchState> {
  final Reader read;
  HikeSearchStateNotifier({required this.read}) : super(HikeSearchState());

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

  updateOrigin(Point newOrigin) => state = state.copyWith(origin: newOrigin);

  updateHits(List<String> newHits) => state = state.copyWith(hits: newHits);

  searchAroundLocation(Point origin) {
    final hikeRepository = read(hikeRepositoryProvider);
    state = state.copyWith(searching: true, noHits: false);
    hikeRepository
        .searchHikeByRadius(SearchByRadiusInput(
            origin: origin, radiusInMeters: state.searchRadius))
        .then((hits) {
      state =
          state.copyWith(hits: hits, searching: false, noHits: hits.isEmpty);
    });
  }

  searchInContent(String text) {
    final hikeRepository = read(hikeRepositoryProvider);
    state = state.copyWith(searching: true, noHits: false);
    hikeRepository
        .searchHikeByContent(SearchByContentInput(content: text))
        .then((hits) {
      state =
          state.copyWith(hits: hits, searching: false, noHits: hits.isEmpty);
    });
  }
}

final hikeSearchStateProvider =
    StateNotifierProvider<HikeSearchStateNotifier, HikeSearchState>(
        (ref) => HikeSearchStateNotifier(read: ref.read));
