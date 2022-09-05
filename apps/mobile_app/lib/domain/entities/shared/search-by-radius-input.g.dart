// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search-by-radius-input.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SearchByRadiusInput {
  const $SearchByRadiusInput();

  Point get origin;
  int get radiusInMeters;
  int? get limit;
  String? get nextToken;

  SearchByRadiusInput copyWith({
    Point? origin,
    int? radiusInMeters,
    int? limit,
    String? nextToken,
  }) =>
      SearchByRadiusInput(
        origin: origin ?? this.origin,
        radiusInMeters: radiusInMeters ?? this.radiusInMeters,
        limit: limit ?? this.limit,
        nextToken: nextToken ?? this.nextToken,
      );

  SearchByRadiusInput copyUsing(
      void Function(SearchByRadiusInput$Change change) mutator) {
    final change = SearchByRadiusInput$Change._(
      this.origin,
      this.radiusInMeters,
      this.limit,
      this.nextToken,
    );
    mutator(change);
    return SearchByRadiusInput(
      origin: change.origin,
      radiusInMeters: change.radiusInMeters,
      limit: change.limit,
      nextToken: change.nextToken,
    );
  }

  @override
  String toString() =>
      "SearchByRadiusInput(origin: $origin, radiusInMeters: $radiusInMeters, limit: $limit, nextToken: $nextToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SearchByRadiusInput &&
      other.runtimeType == runtimeType &&
      origin == other.origin &&
      radiusInMeters == other.radiusInMeters &&
      limit == other.limit &&
      nextToken == other.nextToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + origin.hashCode;
    result = 37 * result + radiusInMeters.hashCode;
    result = 37 * result + limit.hashCode;
    result = 37 * result + nextToken.hashCode;
    return result;
  }
}

class SearchByRadiusInput$Change {
  SearchByRadiusInput$Change._(
    this.origin,
    this.radiusInMeters,
    this.limit,
    this.nextToken,
  );

  Point origin;
  int radiusInMeters;
  int? limit;
  String? nextToken;
}

// ignore: avoid_classes_with_only_static_members
class SearchByRadiusInput$ {
  static final origin = Lens<SearchByRadiusInput, Point>(
    (originContainer) => originContainer.origin,
    (originContainer, origin) => originContainer.copyWith(origin: origin),
  );

  static final radiusInMeters = Lens<SearchByRadiusInput, int>(
    (radiusInMetersContainer) => radiusInMetersContainer.radiusInMeters,
    (radiusInMetersContainer, radiusInMeters) =>
        radiusInMetersContainer.copyWith(radiusInMeters: radiusInMeters),
  );

  static final limit = Lens<SearchByRadiusInput, int?>(
    (limitContainer) => limitContainer.limit,
    (limitContainer, limit) => limitContainer.copyWith(limit: limit),
  );

  static final nextToken = Lens<SearchByRadiusInput, String?>(
    (nextTokenContainer) => nextTokenContainer.nextToken,
    (nextTokenContainer, nextToken) =>
        nextTokenContainer.copyWith(nextToken: nextToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchByRadiusInput _$SearchByRadiusInputFromJson(Map<String, dynamic> json) =>
    SearchByRadiusInput(
      origin: Point.fromJson(json['origin'] as Map<String, dynamic>),
      radiusInMeters: json['radiusInMeters'] as int,
      limit: json['limit'] as int?,
      nextToken: json['nextToken'] as String?,
    );

Map<String, dynamic> _$SearchByRadiusInputToJson(SearchByRadiusInput instance) {
  final val = <String, dynamic>{
    'origin': instance.origin.toJson(),
    'radiusInMeters': instance.radiusInMeters,
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
