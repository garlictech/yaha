// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-hike-by-radius-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchHikeByRadiusInput {
  const $SearchHikeByRadiusInput();

  Location get location;
  double get radiusInMeters;
  int? get limit;
  String? get nextToken;

  SearchHikeByRadiusInput copyWith({
    Location? location,
    double? radiusInMeters,
    int? limit,
    String? nextToken,
  }) =>
      SearchHikeByRadiusInput(
        location: location ?? this.location,
        radiusInMeters: radiusInMeters ?? this.radiusInMeters,
        limit: limit ?? this.limit,
        nextToken: nextToken ?? this.nextToken,
      );

  SearchHikeByRadiusInput copyUsing(
      void Function(SearchHikeByRadiusInput$Change change) mutator) {
    final change = SearchHikeByRadiusInput$Change._(
      this.location,
      this.radiusInMeters,
      this.limit,
      this.nextToken,
    );
    mutator(change);
    return SearchHikeByRadiusInput(
      location: change.location,
      radiusInMeters: change.radiusInMeters,
      limit: change.limit,
      nextToken: change.nextToken,
    );
  }

  @override
  String toString() =>
      "SearchHikeByRadiusInput(location: $location, radiusInMeters: $radiusInMeters, limit: $limit, nextToken: $nextToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchHikeByRadiusInput &&
      other.runtimeType == runtimeType &&
      location == other.location &&
      radiusInMeters == other.radiusInMeters &&
      limit == other.limit &&
      nextToken == other.nextToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + location.hashCode;
    result = 37 * result + radiusInMeters.hashCode;
    result = 37 * result + limit.hashCode;
    result = 37 * result + nextToken.hashCode;
    return result;
  }
}

class SearchHikeByRadiusInput$Change {
  SearchHikeByRadiusInput$Change._(
    this.location,
    this.radiusInMeters,
    this.limit,
    this.nextToken,
  );

  Location location;
  double radiusInMeters;
  int? limit;
  String? nextToken;
}

// ignore: avoid_classes_with_only_static_members
class SearchHikeByRadiusInput$ {
  static final location = Lens<SearchHikeByRadiusInput, Location>(
    (locationContainer) => locationContainer.location,
    (locationContainer, location) =>
        locationContainer.copyWith(location: location),
  );

  static final radiusInMeters = Lens<SearchHikeByRadiusInput, double>(
    (radiusInMetersContainer) => radiusInMetersContainer.radiusInMeters,
    (radiusInMetersContainer, radiusInMeters) =>
        radiusInMetersContainer.copyWith(radiusInMeters: radiusInMeters),
  );

  static final limit = Lens<SearchHikeByRadiusInput, int?>(
    (limitContainer) => limitContainer.limit,
    (limitContainer, limit) => limitContainer.copyWith(limit: limit),
  );

  static final nextToken = Lens<SearchHikeByRadiusInput, String?>(
    (nextTokenContainer) => nextTokenContainer.nextToken,
    (nextTokenContainer, nextToken) =>
        nextTokenContainer.copyWith(nextToken: nextToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHikeByRadiusInput _$SearchHikeByRadiusInputFromJson(
        Map<String, dynamic> json) =>
    SearchHikeByRadiusInput(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      radiusInMeters: (json['radiusInMeters'] as num).toDouble(),
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchHikeByRadiusInputToJson(
        SearchHikeByRadiusInput instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'radiusInMeters': instance.radiusInMeters,
      'limit': instance.limit,
      'nextToken': instance.nextToken,
    };
