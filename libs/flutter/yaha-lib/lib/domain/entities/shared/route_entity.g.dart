// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $RouteEntity {
  const $RouteEntity();

  String get id;
  List<Waypoint> get coordinates;
  List<Image> get images;
  String? get municipality;

  RouteEntity copyWith({
    String? id,
    List<Waypoint>? coordinates,
    List<Image>? images,
    String? municipality,
  }) =>
      RouteEntity(
        id: id ?? this.id,
        coordinates: coordinates ?? this.coordinates,
        images: images ?? this.images,
        municipality: municipality ?? this.municipality,
      );

  RouteEntity copyUsing(void Function(RouteEntity$Change change) mutator) {
    final change = RouteEntity$Change._(
      this.id,
      this.coordinates,
      this.images,
      this.municipality,
    );
    mutator(change);
    return RouteEntity(
      id: change.id,
      coordinates: change.coordinates,
      images: change.images,
      municipality: change.municipality,
    );
  }

  @override
  String toString() =>
      "RouteEntity(id: $id, coordinates: $coordinates, images: $images, municipality: $municipality)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is RouteEntity &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      coordinates == other.coordinates &&
      images == other.images &&
      municipality == other.municipality;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + coordinates.hashCode;
    result = 37 * result + images.hashCode;
    result = 37 * result + municipality.hashCode;
    return result;
  }
}

class RouteEntity$Change {
  RouteEntity$Change._(
    this.id,
    this.coordinates,
    this.images,
    this.municipality,
  );

  String id;
  List<Waypoint> coordinates;
  List<Image> images;
  String? municipality;
}

// ignore: avoid_classes_with_only_static_members
class RouteEntity$ {
  static final id = Lens<RouteEntity, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final coordinates = Lens<RouteEntity, List<Waypoint>>(
    (coordinatesContainer) => coordinatesContainer.coordinates,
    (coordinatesContainer, coordinates) =>
        coordinatesContainer.copyWith(coordinates: coordinates),
  );

  static final images = Lens<RouteEntity, List<Image>>(
    (imagesContainer) => imagesContainer.images,
    (imagesContainer, images) => imagesContainer.copyWith(images: images),
  );

  static final municipality = Lens<RouteEntity, String?>(
    (municipalityContainer) => municipalityContainer.municipality,
    (municipalityContainer, municipality) =>
        municipalityContainer.copyWith(municipality: municipality),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteEntity _$RouteEntityFromJson(Map<String, dynamic> json) => RouteEntity(
      id: json['id'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      municipality: json['municipality'] as String?,
    );

Map<String, dynamic> _$RouteEntityToJson(RouteEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
    'images': instance.images.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('municipality', instance.municipality);
  return val;
}
