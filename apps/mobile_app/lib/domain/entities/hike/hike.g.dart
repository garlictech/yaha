// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Hike {
  const $Hike();

  String get id;
  List<TextualDescription>? get description;
  LineStringData? get route;

  Hike copyWith({
    String? id,
    List<TextualDescription>? description,
    LineStringData? route,
  }) =>
      Hike(
        id: id ?? this.id,
        description: description ?? this.description,
        route: route ?? this.route,
      );

  Hike copyUsing(void Function(Hike$Change change) mutator) {
    final change = Hike$Change._(
      this.id,
      this.description,
      this.route,
    );
    mutator(change);
    return Hike(
      id: change.id,
      description: change.description,
      route: change.route,
    );
  }

  @override
  String toString() =>
      "Hike(id: $id, description: $description, route: $route)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Hike &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      description == other.description &&
      route == other.route;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + description.hashCode;
    result = 37 * result + route.hashCode;
    return result;
  }
}

class Hike$Change {
  Hike$Change._(
    this.id,
    this.description,
    this.route,
  );

  String id;
  List<TextualDescription>? description;
  LineStringData? route;
}

// ignore: avoid_classes_with_only_static_members
class Hike$ {
  static final id = Lens<Hike, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final description = Lens<Hike, List<TextualDescription>?>(
    (descriptionContainer) => descriptionContainer.description,
    (descriptionContainer, description) =>
        descriptionContainer.copyWith(description: description),
  );

  static final route = Lens<Hike, LineStringData?>(
    (routeContainer) => routeContainer.route,
    (routeContainer, route) => routeContainer.copyWith(route: route),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hike _$HikeFromJson(Map<String, dynamic> json) => Hike(
      id: json['id'] as String,
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => TextualDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      route: json['route'] == null
          ? null
          : LineStringData.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HikeToJson(Hike instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'route': instance.route,
    };
