import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/domain/domain.dart';

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

  HikeSearchState(
      {this.lengthMin = 3.0,
      this.lengthMax = 10.0,
      this.durationMin = 8.0,
      this.durationMax = 10.0,
      this.searchRadius = 50.0,
      this.difficulty = 1,
      this.difficultyIndex = 0,
      this.origin = const Location(lat: 0, lon: 0)});
}

class HikeSearchStateNotifier extends StateNotifier<HikeSearchState> {
  HikeSearchStateNotifier() : super(HikeSearchState());

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
}

final hikeSearchStateProvider =
    StateNotifierProvider<HikeSearchStateNotifier, HikeSearchState>(
        (_) => HikeSearchStateNotifier());
