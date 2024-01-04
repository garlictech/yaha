// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_search_results.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $TrackSearchResults {
  const $TrackSearchResults();

  List<TrackEntity> get tracks;
  LatLngBounds? get bounds;

  TrackSearchResults copyWith({
    List<TrackEntity>? tracks,
    LatLngBounds? bounds,
  }) =>
      TrackSearchResults(
        tracks: tracks ?? this.tracks,
        bounds: bounds ?? this.bounds,
      );

  TrackSearchResults copyUsing(
      void Function(TrackSearchResults$Change change) mutator) {
    final change = TrackSearchResults$Change._(
      this.tracks,
      this.bounds,
    );
    mutator(change);
    return TrackSearchResults(
      tracks: change.tracks,
      bounds: change.bounds,
    );
  }

  @override
  String toString() => "TrackSearchResults(tracks: $tracks, bounds: $bounds)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is TrackSearchResults &&
      other.runtimeType == runtimeType &&
      tracks == other.tracks &&
      bounds == other.bounds;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + tracks.hashCode;
    result = 37 * result + bounds.hashCode;
    return result;
  }
}

class TrackSearchResults$Change {
  TrackSearchResults$Change._(
    this.tracks,
    this.bounds,
  );

  List<TrackEntity> tracks;
  LatLngBounds? bounds;
}

// ignore: avoid_classes_with_only_static_members
class TrackSearchResults$ {
  static final tracks = Lens<TrackSearchResults, List<TrackEntity>>(
    (tracksContainer) => tracksContainer.tracks,
    (tracksContainer, tracks) => tracksContainer.copyWith(tracks: tracks),
  );

  static final bounds = Lens<TrackSearchResults, LatLngBounds?>(
    (boundsContainer) => boundsContainer.bounds,
    (boundsContainer, bounds) => boundsContainer.copyWith(bounds: bounds),
  );
}
