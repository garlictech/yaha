// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_search_filters.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $TrackSearchFilters {
  const $TrackSearchFilters();

  double get lengthMin;
  double get lengthMax;
  double get durationMin;
  double get durationMax;
  int get searchRadius;
  int get difficulty;
  int get difficultyIndex;
  GeoPoint get origin;
  List<String> get hits;
  bool get searching;
  bool get noHits;

  TrackSearchFilters copyWith({
    double? lengthMin,
    double? lengthMax,
    double? durationMin,
    double? durationMax,
    int? searchRadius,
    int? difficulty,
    int? difficultyIndex,
    GeoPoint? origin,
    List<String>? hits,
    bool? searching,
    bool? noHits,
  }) =>
      TrackSearchFilters(
        lengthMin: lengthMin ?? this.lengthMin,
        lengthMax: lengthMax ?? this.lengthMax,
        durationMin: durationMin ?? this.durationMin,
        durationMax: durationMax ?? this.durationMax,
        searchRadius: searchRadius ?? this.searchRadius,
        difficulty: difficulty ?? this.difficulty,
        difficultyIndex: difficultyIndex ?? this.difficultyIndex,
        origin: origin ?? this.origin,
        hits: hits ?? this.hits,
        searching: searching ?? this.searching,
        noHits: noHits ?? this.noHits,
      );

  TrackSearchFilters copyUsing(
      void Function(TrackSearchFilters$Change change) mutator) {
    final change = TrackSearchFilters$Change._(
      this.lengthMin,
      this.lengthMax,
      this.durationMin,
      this.durationMax,
      this.searchRadius,
      this.difficulty,
      this.difficultyIndex,
      this.origin,
      this.hits,
      this.searching,
      this.noHits,
    );
    mutator(change);
    return TrackSearchFilters(
      lengthMin: change.lengthMin,
      lengthMax: change.lengthMax,
      durationMin: change.durationMin,
      durationMax: change.durationMax,
      searchRadius: change.searchRadius,
      difficulty: change.difficulty,
      difficultyIndex: change.difficultyIndex,
      origin: change.origin,
      hits: change.hits,
      searching: change.searching,
      noHits: change.noHits,
    );
  }

  @override
  String toString() =>
      "TrackSearchFilters(lengthMin: $lengthMin, lengthMax: $lengthMax, durationMin: $durationMin, durationMax: $durationMax, searchRadius: $searchRadius, difficulty: $difficulty, difficultyIndex: $difficultyIndex, origin: $origin, hits: $hits, searching: $searching, noHits: $noHits)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is TrackSearchFilters &&
      other.runtimeType == runtimeType &&
      lengthMin == other.lengthMin &&
      lengthMax == other.lengthMax &&
      durationMin == other.durationMin &&
      durationMax == other.durationMax &&
      searchRadius == other.searchRadius &&
      difficulty == other.difficulty &&
      difficultyIndex == other.difficultyIndex &&
      origin == other.origin &&
      hits == other.hits &&
      searching == other.searching &&
      noHits == other.noHits;

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
    result = 37 * result + searching.hashCode;
    result = 37 * result + noHits.hashCode;
    return result;
  }
}

class TrackSearchFilters$Change {
  TrackSearchFilters$Change._(
    this.lengthMin,
    this.lengthMax,
    this.durationMin,
    this.durationMax,
    this.searchRadius,
    this.difficulty,
    this.difficultyIndex,
    this.origin,
    this.hits,
    this.searching,
    this.noHits,
  );

  double lengthMin;
  double lengthMax;
  double durationMin;
  double durationMax;
  int searchRadius;
  int difficulty;
  int difficultyIndex;
  GeoPoint origin;
  List<String> hits;
  bool searching;
  bool noHits;
}

// ignore: avoid_classes_with_only_static_members
class TrackSearchFilters$ {
  static final lengthMin = Lens<TrackSearchFilters, double>(
    (lengthMinContainer) => lengthMinContainer.lengthMin,
    (lengthMinContainer, lengthMin) =>
        lengthMinContainer.copyWith(lengthMin: lengthMin),
  );

  static final lengthMax = Lens<TrackSearchFilters, double>(
    (lengthMaxContainer) => lengthMaxContainer.lengthMax,
    (lengthMaxContainer, lengthMax) =>
        lengthMaxContainer.copyWith(lengthMax: lengthMax),
  );

  static final durationMin = Lens<TrackSearchFilters, double>(
    (durationMinContainer) => durationMinContainer.durationMin,
    (durationMinContainer, durationMin) =>
        durationMinContainer.copyWith(durationMin: durationMin),
  );

  static final durationMax = Lens<TrackSearchFilters, double>(
    (durationMaxContainer) => durationMaxContainer.durationMax,
    (durationMaxContainer, durationMax) =>
        durationMaxContainer.copyWith(durationMax: durationMax),
  );

  static final searchRadius = Lens<TrackSearchFilters, int>(
    (searchRadiusContainer) => searchRadiusContainer.searchRadius,
    (searchRadiusContainer, searchRadius) =>
        searchRadiusContainer.copyWith(searchRadius: searchRadius),
  );

  static final difficulty = Lens<TrackSearchFilters, int>(
    (difficultyContainer) => difficultyContainer.difficulty,
    (difficultyContainer, difficulty) =>
        difficultyContainer.copyWith(difficulty: difficulty),
  );

  static final difficultyIndex = Lens<TrackSearchFilters, int>(
    (difficultyIndexContainer) => difficultyIndexContainer.difficultyIndex,
    (difficultyIndexContainer, difficultyIndex) =>
        difficultyIndexContainer.copyWith(difficultyIndex: difficultyIndex),
  );

  static final origin = Lens<TrackSearchFilters, GeoPoint>(
    (originContainer) => originContainer.origin,
    (originContainer, origin) => originContainer.copyWith(origin: origin),
  );

  static final hits = Lens<TrackSearchFilters, List<String>>(
    (hitsContainer) => hitsContainer.hits,
    (hitsContainer, hits) => hitsContainer.copyWith(hits: hits),
  );

  static final searching = Lens<TrackSearchFilters, bool>(
    (searchingContainer) => searchingContainer.searching,
    (searchingContainer, searching) =>
        searchingContainer.copyWith(searching: searching),
  );

  static final noHits = Lens<TrackSearchFilters, bool>(
    (noHitsContainer) => noHitsContainer.noHits,
    (noHitsContainer, noHits) => noHitsContainer.copyWith(noHits: noHits),
  );
}
