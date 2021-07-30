// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $FilterSettingsState {
  const $FilterSettingsState();

  double get lengthMin;
  double get lengthMax;
  double get durationMin;
  double get durationMax;
  double get searchRadius;
  int get difficulty;
  int get difficultyIndex;

  FilterSettingsState copyWith({
    double? lengthMin,
    double? lengthMax,
    double? durationMin,
    double? durationMax,
    double? searchRadius,
    int? difficulty,
    int? difficultyIndex,
  }) =>
      FilterSettingsState(
        lengthMin: lengthMin ?? this.lengthMin,
        lengthMax: lengthMax ?? this.lengthMax,
        durationMin: durationMin ?? this.durationMin,
        durationMax: durationMax ?? this.durationMax,
        searchRadius: searchRadius ?? this.searchRadius,
        difficulty: difficulty ?? this.difficulty,
        difficultyIndex: difficultyIndex ?? this.difficultyIndex,
      );

  FilterSettingsState copyUsing(
      void Function(FilterSettingsState$Change change) mutator) {
    final change = FilterSettingsState$Change._(
      this.lengthMin,
      this.lengthMax,
      this.durationMin,
      this.durationMax,
      this.searchRadius,
      this.difficulty,
      this.difficultyIndex,
    );
    mutator(change);
    return FilterSettingsState(
      lengthMin: change.lengthMin,
      lengthMax: change.lengthMax,
      durationMin: change.durationMin,
      durationMax: change.durationMax,
      searchRadius: change.searchRadius,
      difficulty: change.difficulty,
      difficultyIndex: change.difficultyIndex,
    );
  }

  @override
  String toString() =>
      "FilterSettingsState(lengthMin: $lengthMin, lengthMax: $lengthMax, durationMin: $durationMin, durationMax: $durationMax, searchRadius: $searchRadius, difficulty: $difficulty, difficultyIndex: $difficultyIndex)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is FilterSettingsState &&
      other.runtimeType == runtimeType &&
      lengthMin == other.lengthMin &&
      lengthMax == other.lengthMax &&
      durationMin == other.durationMin &&
      durationMax == other.durationMax &&
      searchRadius == other.searchRadius &&
      difficulty == other.difficulty &&
      difficultyIndex == other.difficultyIndex;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + lengthMin.hashCode;
    result = 37 * result + lengthMax.hashCode;
    result = 37 * result + durationMin.hashCode;
    result = 37 * result + durationMax.hashCode;
    result = 37 * result + searchRadius.hashCode;
    result = 37 * result + difficulty.hashCode;
    result = 37 * result + difficultyIndex.hashCode;
    return result;
  }
}

class FilterSettingsState$Change {
  FilterSettingsState$Change._(
    this.lengthMin,
    this.lengthMax,
    this.durationMin,
    this.durationMax,
    this.searchRadius,
    this.difficulty,
    this.difficultyIndex,
  );

  double lengthMin;
  double lengthMax;
  double durationMin;
  double durationMax;
  double searchRadius;
  int difficulty;
  int difficultyIndex;
}

// ignore: avoid_classes_with_only_static_members
class FilterSettingsState$ {
  static final lengthMin = Lens<FilterSettingsState, double>(
    (lengthMinContainer) => lengthMinContainer.lengthMin,
    (lengthMinContainer, lengthMin) =>
        lengthMinContainer.copyWith(lengthMin: lengthMin),
  );

  static final lengthMax = Lens<FilterSettingsState, double>(
    (lengthMaxContainer) => lengthMaxContainer.lengthMax,
    (lengthMaxContainer, lengthMax) =>
        lengthMaxContainer.copyWith(lengthMax: lengthMax),
  );

  static final durationMin = Lens<FilterSettingsState, double>(
    (durationMinContainer) => durationMinContainer.durationMin,
    (durationMinContainer, durationMin) =>
        durationMinContainer.copyWith(durationMin: durationMin),
  );

  static final durationMax = Lens<FilterSettingsState, double>(
    (durationMaxContainer) => durationMaxContainer.durationMax,
    (durationMaxContainer, durationMax) =>
        durationMaxContainer.copyWith(durationMax: durationMax),
  );

  static final searchRadius = Lens<FilterSettingsState, double>(
    (searchRadiusContainer) => searchRadiusContainer.searchRadius,
    (searchRadiusContainer, searchRadius) =>
        searchRadiusContainer.copyWith(searchRadius: searchRadius),
  );

  static final difficulty = Lens<FilterSettingsState, int>(
    (difficultyContainer) => difficultyContainer.difficulty,
    (difficultyContainer, difficulty) =>
        difficultyContainer.copyWith(difficulty: difficulty),
  );

  static final difficultyIndex = Lens<FilterSettingsState, int>(
    (difficultyIndexContainer) => difficultyIndexContainer.difficultyIndex,
    (difficultyIndexContainer, difficultyIndex) =>
        difficultyIndexContainer.copyWith(difficultyIndex: difficultyIndex),
  );
}
