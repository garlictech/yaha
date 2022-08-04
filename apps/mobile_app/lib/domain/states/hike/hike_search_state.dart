import 'package:flutter/cupertino.dart';
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
  final double searchRadius;
  @override
  final int difficulty;
  @override
  final int difficultyIndex;
  @override
  final Location origin;
  @override
  final List<Hike> hits;
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
      this.origin = const Location(lat: 0, lon: 0)});
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

  updateSearchRadius(double newState) =>
      state = state.copyWith(searchRadius: newState);

  updateDifficulty(int newState, int index) =>
      state = state.copyWith(difficulty: newState, difficultyIndex: index);

  updateOrigin(Location newOrigin) => state = state.copyWith(origin: newOrigin);

  updateHits(List<Hike> newHits) => state = state.copyWith(hits: newHits);

  searchAroundLocation(Location origin) {
    final hikeSearchUseCases = read(hikeSearchUsecasesProvider);
    state = state.copyWith(searching: true, noHits: false);
    hikeSearchUseCases
        .searchHikesAroundLocation(origin, state.searchRadius, 10)
        .then((hits) {
      debugPrint(hits.toString());
      state =
          state.copyWith(hits: hits, searching: false, noHits: hits.isEmpty);
    });
  }

  searchInContent(String text) {
    final hikeSearchUseCases = read(hikeSearchUsecasesProvider);
    state = state.copyWith(searching: true, noHits: false);
    hikeSearchUseCases.searchHikesByContent(text, 10).then((hits) {
      state =
          state.copyWith(hits: hits, searching: false, noHits: hits.isEmpty);
    });
  }
}

final hikeSearchStateProvider =
    StateNotifierProvider<HikeSearchStateNotifier, HikeSearchState>(
        (ref) => HikeSearchStateNotifier(read: ref.read));
