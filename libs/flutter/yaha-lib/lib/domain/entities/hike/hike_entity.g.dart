// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HikeEntity {
  const $HikeEntity();

  String get id;
  List<Description> get descriptions;
  RouteEntity get route;

  HikeEntity copyWith({
    String? id,
    List<Description>? descriptions,
    RouteEntity? route,
  }) =>
      HikeEntity(
        id: id ?? this.id,
        descriptions: descriptions ?? this.descriptions,
        route: route ?? this.route,
      );

  HikeEntity copyUsing(void Function(HikeEntity$Change change) mutator) {
    final change = HikeEntity$Change._(
      this.id,
      this.descriptions,
      this.route,
    );
    mutator(change);
    return HikeEntity(
      id: change.id,
      descriptions: change.descriptions,
      route: change.route,
    );
  }

  @override
  String toString() =>
      "HikeEntity(id: $id, descriptions: $descriptions, route: $route)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HikeEntity &&
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

class HikeEntity$Change {
  HikeEntity$Change._(
    this.id,
    this.descriptions,
    this.route,
  );

  String id;
  List<Description> descriptions;
  RouteEntity route;
}

// ignore: avoid_classes_with_only_static_members
class HikeEntity$ {
  static final id = Lens<HikeEntity, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final descriptions = Lens<HikeEntity, List<Description>>(
    (descriptionsContainer) => descriptionsContainer.descriptions,
    (descriptionsContainer, descriptions) =>
        descriptionsContainer.copyWith(descriptions: descriptions),
  );

  static final route = Lens<HikeEntity, RouteEntity>(
    (routeContainer) => routeContainer.route,
    (routeContainer, route) => routeContainer.copyWith(route: route),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HikeEntity _$HikeEntityFromJson(Map<String, dynamic> json) => HikeEntity(
      id: json['id'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: RouteEntity.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HikeEntityToJson(HikeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descriptions': instance.descriptions.map((e) => e.toJson()).toList(),
      'route': instance.route.toJson(),
    };
