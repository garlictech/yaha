// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_search_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HikeSearchState {
  const $HikeSearchState();

  double get lengthMin;
  double get lengthMax;
  double get durationMin;
  double get durationMax;
  double get searchRadius;
  int get difficulty;
  int get difficultyIndex;
  Location get origin;
  List<Hike> get hits;

  HikeSearchState copyWith({
    double? lengthMin,
    double? lengthMax,
    double? durationMin,
    double? durationMax,
    double? searchRadius,
    int? difficulty,
    int? difficultyIndex,
    Location? origin,
    List<Hike>? hits,
  }) =>
      HikeSearchState(
        lengthMin: lengthMin ?? this.lengthMin,
        lengthMax: lengthMax ?? this.lengthMax,
        durationMin: durationMin ?? this.durationMin,
        durationMax: durationMax ?? this.durationMax,
        searchRadius: searchRadius ?? this.searchRadius,
        difficulty: difficulty ?? this.difficulty,
        difficultyIndex: difficultyIndex ?? this.difficultyIndex,
        origin: origin ?? this.origin,
        hits: hits ?? this.hits,
      );

  HikeSearchState copyUsing(
      void Function(HikeSearchState$Change change) mutator) {
    final change = HikeSearchState$Change._(
      this.lengthMin,
      this.lengthMax,
      this.durationMin,
      this.durationMax,
      this.searchRadius,
      this.difficulty,
      this.difficultyIndex,
      this.origin,
      this.hits,
    );
    mutator(change);
    return HikeSearchState(
      lengthMin: change.lengthMin,
      lengthMax: change.lengthMax,
      durationMin: change.durationMin,
      durationMax: change.durationMax,
      searchRadius: change.searchRadius,
      difficulty: change.difficulty,
      difficultyIndex: change.difficultyIndex,
      origin: change.origin,
      hits: change.hits,
    );
  }

  @override
  String toString() =>
      "HikeSearchState(lengthMin: $lengthMin, lengthMax: $lengthMax, durationMin: $durationMin, durationMax: $durationMax, searchRadius: $searchRadius, difficulty: $difficulty, difficultyIndex: $difficultyIndex, origin: $origin, hits: $hits)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HikeSearchState &&
      other.runtimeType == runtimeType &&
      lengthMin == other.lengthMin &&
      lengthMax == other.lengthMax &&
      durationMin == other.durationMin &&
      durationMax == other.durationMax &&
      searchRadius == other.searchRadius &&
      difficulty == other.difficulty &&
      difficultyIndex == other.difficultyIndex &&
      origin == other.origin &&
      hits == other.hits;

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
    result = 37 * result + origin.hashCode;
    result = 37 * result + hits.hashCode;
    return result;
  }
}

class HikeSearchState$Change {
  HikeSearchState$Change._(
    this.lengthMin,
    this.lengthMax,
    this.durationMin,
    this.durationMax,
    this.searchRadius,
    this.difficulty,
    this.difficultyIndex,
    this.origin,
    this.hits,
  );

  double lengthMin;
  double lengthMax;
  double durationMin;
  double durationMax;
  double searchRadius;
  int difficulty;
  int difficultyIndex;
  Location origin;
  List<Hike> hits;
}

// ignore: avoid_classes_with_only_static_members
class HikeSearchState$ {
  static final lengthMin = Lens<HikeSearchState, double>(
    (lengthMinContainer) => lengthMinContainer.lengthMin,
    (lengthMinContainer, lengthMin) =>
        lengthMinContainer.copyWith(lengthMin: lengthMin),
  );

  static final lengthMax = Lens<HikeSearchState, double>(
    (lengthMaxContainer) => lengthMaxContainer.lengthMax,
    (lengthMaxContainer, lengthMax) =>
        lengthMaxContainer.copyWith(lengthMax: lengthMax),
  );

  static final durationMin = Lens<HikeSearchState, double>(
    (durationMinContainer) => durationMinContainer.durationMin,
    (durationMinContainer, durationMin) =>
        durationMinContainer.copyWith(durationMin: durationMin),
  );

  static final durationMax = Lens<HikeSearchState, double>(
    (durationMaxContainer) => durationMaxContainer.durationMax,
    (durationMaxContainer, durationMax) =>
        durationMaxContainer.copyWith(durationMax: durationMax),
  );

  static final searchRadius = Lens<HikeSearchState, double>(
    (searchRadiusContainer) => searchRadiusContainer.searchRadius,
    (searchRadiusContainer, searchRadius) =>
        searchRadiusContainer.copyWith(searchRadius: searchRadius),
  );

  static final difficulty = Lens<HikeSearchState, int>(
    (difficultyContainer) => difficultyContainer.difficulty,
    (difficultyContainer, difficulty) =>
        difficultyContainer.copyWith(difficulty: difficulty),
  );

  static final difficultyIndex = Lens<HikeSearchState, int>(
    (difficultyIndexContainer) => difficultyIndexContainer.difficultyIndex,
    (difficultyIndexContainer, difficultyIndex) =>
        difficultyIndexContainer.copyWith(difficultyIndex: difficultyIndex),
  );

  static final origin = Lens<HikeSearchState, Location>(
    (originContainer) => originContainer.origin,
    (originContainer, origin) => originContainer.copyWith(origin: origin),
  );

  static final hits = Lens<HikeSearchState, List<Hike>>(
    (hitsContainer) => hitsContainer.hits,
    (hitsContainer, hits) => hitsContainer.copyWith(hits: hits),
  );
}
