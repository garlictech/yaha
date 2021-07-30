import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';

@FunctionalData()
class FilterSettingsState {
  final double lengthMin;
  final double lengthMax;
  final double durationMin;
  final double durationMax;
  final double searchRadius;
  final int difficulty;
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
      state = FilterSettingsState(
          lengthMin: newLenghtMinState, lengthMax: newLengthMaxState);

  updateDuration(double newDurationMinState, double newDurationMaxState) =>
      state = FilterSettingsState(
          durationMin: newDurationMinState, durationMax: newDurationMaxState);

  updateSearchRadius(double newState) =>
      state = FilterSettingsState(searchRadius: newState);

  updateDifficulty(int newState, int index) =>
      state = FilterSettingsState(difficulty: newState, difficultyIndex: index);
}

final filterSettingsStateProvider =
    StateNotifierProvider<FilterSettingsStateNotifier, FilterSettingsState>(
        (_) => FilterSettingsStateNotifier());
