// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $TrackEntity {
  const $TrackEntity();

  String get id;
  List<Description> get descriptions;
  RouteEntity get route;

  TrackEntity copyWith({
    String? id,
    List<Description>? descriptions,
    RouteEntity? route,
  }) =>
      TrackEntity(
        id: id ?? this.id,
        descriptions: descriptions ?? this.descriptions,
        route: route ?? this.route,
      );

  TrackEntity copyUsing(void Function(TrackEntity$Change change) mutator) {
    final change = TrackEntity$Change._(
      this.id,
      this.descriptions,
      this.route,
    );
    mutator(change);
    return TrackEntity(
      id: change.id,
      descriptions: change.descriptions,
      route: change.route,
    );
  }

  @override
  String toString() =>
      "TrackEntity(id: $id, descriptions: $descriptions, route: $route)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is TrackEntity &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      descriptions == other.descriptions &&
      route == other.route;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + descriptions.hashCode;
    result = 37 * result + route.hashCode;
    return result;
  }
}

class TrackEntity$Change {
  TrackEntity$Change._(
    this.id,
    this.descriptions,
    this.route,
  );

  String id;
  List<Description> descriptions;
  RouteEntity route;
}

// ignore: avoid_classes_with_only_static_members
class TrackEntity$ {
  static final id = Lens<TrackEntity, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final descriptions = Lens<TrackEntity, List<Description>>(
    (descriptionsContainer) => descriptionsContainer.descriptions,
    (descriptionsContainer, descriptions) =>
        descriptionsContainer.copyWith(descriptions: descriptions),
  );

  static final route = Lens<TrackEntity, RouteEntity>(
    (routeContainer) => routeContainer.route,
    (routeContainer, route) => routeContainer.copyWith(route: route),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackEntity _$TrackEntityFromJson(Map<String, dynamic> json) => TrackEntity(
      id: json['id'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: RouteEntity.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackEntityToJson(TrackEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descriptions': instance.descriptions.map((e) => e.toJson()).toList(),
      'route': instance.route.toJson(),
    };
