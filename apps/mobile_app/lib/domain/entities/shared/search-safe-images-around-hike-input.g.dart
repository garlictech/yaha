// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-safe-images-around-hike-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchSafeImagesAroundHikeInput {
  const $SearchSafeImagesAroundHikeInput();

  String get hikeId;
  double get distanceInMeters;
  int? get limit;
  String? get nextToken;

  SearchSafeImagesAroundHikeInput copyWith({
    String? hikeId,
    double? distanceInMeters,
    int? limit,
    String? nextToken,
  }) =>
      SearchSafeImagesAroundHikeInput(
        hikeId: hikeId ?? this.hikeId,
        distanceInMeters: distanceInMeters ?? this.distanceInMeters,
        limit: limit ?? this.limit,
        nextToken: nextToken ?? this.nextToken,
      );

  SearchSafeImagesAroundHikeInput copyUsing(
      void Function(SearchSafeImagesAroundHikeInput$Change change) mutator) {
    final change = SearchSafeImagesAroundHikeInput$Change._(
      this.hikeId,
      this.distanceInMeters,
      this.limit,
      this.nextToken,
    );
    mutator(change);
    return SearchSafeImagesAroundHikeInput(
      hikeId: change.hikeId,
      distanceInMeters: change.distanceInMeters,
      limit: change.limit,
      nextToken: change.nextToken,
    );
  }

  @override
  String toString() =>
      "SearchSafeImagesAroundHikeInput(hikeId: $hikeId, distanceInMeters: $distanceInMeters, limit: $limit, nextToken: $nextToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchSafeImagesAroundHikeInput &&
      other.runtimeType == runtimeType &&
      hikeId == other.hikeId &&
      distanceInMeters == other.distanceInMeters &&
      limit == other.limit &&
      nextToken == other.nextToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + hikeId.hashCode;
    result = 37 * result + distanceInMeters.hashCode;
    result = 37 * result + limit.hashCode;
    result = 37 * result + nextToken.hashCode;
    return result;
  }
}

class SearchSafeImagesAroundHikeInput$Change {
  SearchSafeImagesAroundHikeInput$Change._(
    this.hikeId,
    this.distanceInMeters,
    this.limit,
    this.nextToken,
  );

  String hikeId;
  double distanceInMeters;
  int? limit;
  String? nextToken;
}

// ignore: avoid_classes_with_only_static_members
class SearchSafeImagesAroundHikeInput$ {
  static final hikeId = Lens<SearchSafeImagesAroundHikeInput, String>(
    (hikeIdContainer) => hikeIdContainer.hikeId,
    (hikeIdContainer, hikeId) => hikeIdContainer.copyWith(hikeId: hikeId),
  );

  static final distanceInMeters = Lens<SearchSafeImagesAroundHikeInput, double>(
    (distanceInMetersContainer) => distanceInMetersContainer.distanceInMeters,
    (distanceInMetersContainer, distanceInMeters) =>
        distanceInMetersContainer.copyWith(distanceInMeters: distanceInMeters),
  );

  static final limit = Lens<SearchSafeImagesAroundHikeInput, int?>(
    (limitContainer) => limitContainer.limit,
    (limitContainer, limit) => limitContainer.copyWith(limit: limit),
  );

  static final nextToken = Lens<SearchSafeImagesAroundHikeInput, String?>(
    (nextTokenContainer) => nextTokenContainer.nextToken,
    (nextTokenContainer, nextToken) =>
        nextTokenContainer.copyWith(nextToken: nextToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSafeImagesAroundHikeInput _$SearchSafeImagesAroundHikeInputFromJson(
        Map<String, dynamic> json) =>
    SearchSafeImagesAroundHikeInput(
      hikeId: json['hikeId'] as String,
      distanceInMeters: (json['distanceInMeters'] as num).toDouble(),
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchSafeImagesAroundHikeInputToJson(
        SearchSafeImagesAroundHikeInput instance) =>
    <String, dynamic>{
      'hikeId': instance.hikeId,
      'distanceInMeters': instance.distanceInMeters,
      'limit': instance.limit,
      'nextToken': instance.nextToken,
    };
