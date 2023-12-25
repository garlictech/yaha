// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-safe-images-around-hike-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchSafeImagesAroundHikeInput {
  const $SearchSafeImagesAroundHikeInput();

  String get hikeId;
  int get distanceInMeters;

  SearchSafeImagesAroundHikeInput copyWith({
    String? hikeId,
    int? distanceInMeters,
  }) =>
      SearchSafeImagesAroundHikeInput(
        hikeId: hikeId ?? this.hikeId,
        distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      );

  SearchSafeImagesAroundHikeInput copyUsing(
      void Function(SearchSafeImagesAroundHikeInput$Change change) mutator) {
    final change = SearchSafeImagesAroundHikeInput$Change._(
      this.hikeId,
      this.distanceInMeters,
    );
    mutator(change);
    return SearchSafeImagesAroundHikeInput(
      hikeId: change.hikeId,
      distanceInMeters: change.distanceInMeters,
    );
  }

  @override
  String toString() =>
      "SearchSafeImagesAroundHikeInput(hikeId: $hikeId, distanceInMeters: $distanceInMeters)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchSafeImagesAroundHikeInput &&
      other.runtimeType == runtimeType &&
      hikeId == other.hikeId &&
      distanceInMeters == other.distanceInMeters;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + hikeId.hashCode;
    result = 37 * result + distanceInMeters.hashCode;
    return result;
  }
}

class SearchSafeImagesAroundHikeInput$Change {
  SearchSafeImagesAroundHikeInput$Change._(
    this.hikeId,
    this.distanceInMeters,
  );

  String hikeId;
  int distanceInMeters;
}

// ignore: avoid_classes_with_only_static_members
class SearchSafeImagesAroundHikeInput$ {
  static final hikeId = Lens<SearchSafeImagesAroundHikeInput, String>(
    (hikeIdContainer) => hikeIdContainer.hikeId,
    (hikeIdContainer, hikeId) => hikeIdContainer.copyWith(hikeId: hikeId),
  );

  static final distanceInMeters = Lens<SearchSafeImagesAroundHikeInput, int>(
    (distanceInMetersContainer) => distanceInMetersContainer.distanceInMeters,
    (distanceInMetersContainer, distanceInMeters) =>
        distanceInMetersContainer.copyWith(distanceInMeters: distanceInMeters),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSafeImagesAroundHikeInput _$SearchSafeImagesAroundHikeInputFromJson(
        Map<String, dynamic> json) =>
    SearchSafeImagesAroundHikeInput(
      hikeId: json['hikeId'] as String,
      distanceInMeters: json['distanceInMeters'] as int,
    );

Map<String, dynamic> _$SearchSafeImagesAroundHikeInputToJson(
        SearchSafeImagesAroundHikeInput instance) =>
    <String, dynamic>{
      'hikeId': instance.hikeId,
      'distanceInMeters': instance.distanceInMeters,
    };
