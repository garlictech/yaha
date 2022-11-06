// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-around-hike-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchAroundHikeInput {
  const $SearchAroundHikeInput();

  String get hikeId;
  double get distanceInMeters;
  String get objectType;
  int? get limit;
  String? get nextToken;

  SearchAroundHikeInput copyWith({
    String? hikeId,
    double? distanceInMeters,
    String? objectType,
    int? limit,
    String? nextToken,
  }) =>
      SearchAroundHikeInput(
        hikeId: hikeId ?? this.hikeId,
        distanceInMeters: distanceInMeters ?? this.distanceInMeters,
        objectType: objectType ?? this.objectType,
        limit: limit ?? this.limit,
        nextToken: nextToken ?? this.nextToken,
      );

  SearchAroundHikeInput copyUsing(
      void Function(SearchAroundHikeInput$Change change) mutator) {
    final change = SearchAroundHikeInput$Change._(
      this.hikeId,
      this.distanceInMeters,
      this.objectType,
      this.limit,
      this.nextToken,
    );
    mutator(change);
    return SearchAroundHikeInput(
      hikeId: change.hikeId,
      distanceInMeters: change.distanceInMeters,
      objectType: change.objectType,
      limit: change.limit,
      nextToken: change.nextToken,
    );
  }

  @override
  String toString() =>
      "SearchAroundHikeInput(hikeId: $hikeId, distanceInMeters: $distanceInMeters, objectType: $objectType, limit: $limit, nextToken: $nextToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchAroundHikeInput &&
      other.runtimeType == runtimeType &&
      hikeId == other.hikeId &&
      distanceInMeters == other.distanceInMeters &&
      objectType == other.objectType &&
      limit == other.limit &&
      nextToken == other.nextToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + hikeId.hashCode;
    result = 37 * result + distanceInMeters.hashCode;
    result = 37 * result + objectType.hashCode;
    result = 37 * result + limit.hashCode;
    result = 37 * result + nextToken.hashCode;
    return result;
  }
}

class SearchAroundHikeInput$Change {
  SearchAroundHikeInput$Change._(
    this.hikeId,
    this.distanceInMeters,
    this.objectType,
    this.limit,
    this.nextToken,
  );

  String hikeId;
  double distanceInMeters;
  String objectType;
  int? limit;
  String? nextToken;
}

// ignore: avoid_classes_with_only_static_members
class SearchAroundHikeInput$ {
  static final hikeId = Lens<SearchAroundHikeInput, String>(
    (hikeIdContainer) => hikeIdContainer.hikeId,
    (hikeIdContainer, hikeId) => hikeIdContainer.copyWith(hikeId: hikeId),
  );

  static final distanceInMeters = Lens<SearchAroundHikeInput, double>(
    (distanceInMetersContainer) => distanceInMetersContainer.distanceInMeters,
    (distanceInMetersContainer, distanceInMeters) =>
        distanceInMetersContainer.copyWith(distanceInMeters: distanceInMeters),
  );

  static final objectType = Lens<SearchAroundHikeInput, String>(
    (objectTypeContainer) => objectTypeContainer.objectType,
    (objectTypeContainer, objectType) =>
        objectTypeContainer.copyWith(objectType: objectType),
  );

  static final limit = Lens<SearchAroundHikeInput, int?>(
    (limitContainer) => limitContainer.limit,
    (limitContainer, limit) => limitContainer.copyWith(limit: limit),
  );

  static final nextToken = Lens<SearchAroundHikeInput, String?>(
    (nextTokenContainer) => nextTokenContainer.nextToken,
    (nextTokenContainer, nextToken) =>
        nextTokenContainer.copyWith(nextToken: nextToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAroundHikeInput _$SearchAroundHikeInputFromJson(
        Map<String, dynamic> json) =>
    SearchAroundHikeInput(
      hikeId: json['hikeId'] as String,
      distanceInMeters: (json['distanceInMeters'] as num).toDouble(),
      objectType: json['objectType'] as String,
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchAroundHikeInputToJson(
    SearchAroundHikeInput instance) {
  final val = <String, dynamic>{
    'hikeId': instance.hikeId,
    'distanceInMeters': instance.distanceInMeters,
    'objectType': instance.objectType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}
