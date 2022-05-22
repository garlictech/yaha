import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';

part 'filter-state.g.dart';

@FunctionalData()
class FilterSettingsState extends $FilterSettingsState {
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

  FilterSettingsState({
    this.lengthMin = 3.0,
    this.lengthMax = 10.0,
    this.durationMin = 8.0,
    this.durationMax = 10.0,
    this.searchRadius = 50.0,
    this.difficulty = 1,
    this.difficultyIndex = 0,
  });
}

class FilterSettingsStateNotifier extends StateNotifier<FilterSettingsState> {
  FilterSettingsStateNotifier() : super(FilterSettingsState());

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
}

final filterSettingsStateProvider =
    StateNotifierProvider<FilterSettingsStateNotifier, FilterSettingsState>(
        (_) => FilterSettingsStateNotifier());
