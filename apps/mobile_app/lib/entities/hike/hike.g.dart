// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Hike {
  const $Hike();

  String get id;
  List<TextualDescription>? get description;
  GeoJsonData? get route;
  List<String>? get imageUrls;

  Hike copyWith({
    String? id,
    List<TextualDescription>? description,
    GeoJsonData? route,
    List<String>? imageUrls,
  }) =>
      Hike(
        id: id ?? this.id,
        description: description ?? this.description,
        route: route ?? this.route,
        imageUrls: imageUrls ?? this.imageUrls,
      );

  Hike copyUsing(void Function(Hike$Change change) mutator) {
    final change = Hike$Change._(
      this.id,
      this.description,
      this.route,
      this.imageUrls,
    );
    mutator(change);
    return Hike(
      id: change.id,
      description: change.description,
      route: change.route,
      imageUrls: change.imageUrls,
    );
  }

  @override
  String toString() =>
      "Hike(id: $id, description: $description, route: $route, imageUrls: $imageUrls)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Hike &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      description == other.description &&
      route == other.route &&
      imageUrls == other.imageUrls;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + description.hashCode;
    result = 37 * result + route.hashCode;
    result = 37 * result + imageUrls.hashCode;
    return result;
  }
}

class Hike$Change {
  Hike$Change._(
    this.id,
    this.description,
    this.route,
    this.imageUrls,
  );

  String id;
  List<TextualDescription>? description;
  GeoJsonData? route;
  List<String>? imageUrls;
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

  static final route = Lens<Hike, GeoJsonData?>(
    (routeContainer) => routeContainer.route,
    (routeContainer, route) => routeContainer.copyWith(route: route),
  );

  static final imageUrls = Lens<Hike, List<String>?>(
    (imageUrlsContainer) => imageUrlsContainer.imageUrls,
    (imageUrlsContainer, imageUrls) =>
        imageUrlsContainer.copyWith(imageUrls: imageUrls),
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
          : GeoJsonData.fromJson(json['route'] as Map<String, dynamic>),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HikeToJson(Hike instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'route': instance.route,
      'imageUrls': instance.imageUrls,
    };
