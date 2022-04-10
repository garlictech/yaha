// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Poi {
  const $Poi();

  String get id;
  Location get location;
  double? get elevation;
  List<String>? get types;
  TextualDescription? get description;
  List<String>? get tags;
  String? get address;
  String? get phoneNumber;
  String? get openingHours;

  Poi copyWith({
    String? id,
    Location? location,
    double? elevation,
    List<String>? types,
    TextualDescription? description,
    List<String>? tags,
    String? address,
    String? phoneNumber,
    String? openingHours,
  }) =>
      Poi(
        id: id ?? this.id,
        location: location ?? this.location,
        elevation: elevation ?? this.elevation,
        types: types ?? this.types,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        openingHours: openingHours ?? this.openingHours,
      );

  Poi copyUsing(void Function(Poi$Change change) mutator) {
    final change = Poi$Change._(
      this.id,
      this.location,
      this.elevation,
      this.types,
      this.description,
      this.tags,
      this.address,
      this.phoneNumber,
      this.openingHours,
    );
    mutator(change);
    return Poi(
      id: change.id,
      location: change.location,
      elevation: change.elevation,
      types: change.types,
      description: change.description,
      tags: change.tags,
      address: change.address,
      phoneNumber: change.phoneNumber,
      openingHours: change.openingHours,
    );
  }

  @override
  String toString() =>
      "Poi(id: $id, location: $location, elevation: $elevation, types: $types, description: $description, tags: $tags, address: $address, phoneNumber: $phoneNumber, openingHours: $openingHours)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Poi &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      location == other.location &&
      elevation == other.elevation &&
      types == other.types &&
      description == other.description &&
      tags == other.tags &&
      address == other.address &&
      phoneNumber == other.phoneNumber &&
      openingHours == other.openingHours;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + location.hashCode;
    result = 37 * result + elevation.hashCode;
    result = 37 * result + types.hashCode;
    result = 37 * result + description.hashCode;
    result = 37 * result + tags.hashCode;
    result = 37 * result + address.hashCode;
    result = 37 * result + phoneNumber.hashCode;
    result = 37 * result + openingHours.hashCode;
    return result;
  }
}

class Poi$Change {
  Poi$Change._(
    this.id,
    this.location,
    this.elevation,
    this.types,
    this.description,
    this.tags,
    this.address,
    this.phoneNumber,
    this.openingHours,
  );

  String id;
  Location location;
  double? elevation;
  List<String>? types;
  TextualDescription? description;
  List<String>? tags;
  String? address;
  String? phoneNumber;
  String? openingHours;
}

// ignore: avoid_classes_with_only_static_members
class Poi$ {
  static final id = Lens<Poi, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final location = Lens<Poi, Location>(
    (locationContainer) => locationContainer.location,
    (locationContainer, location) =>
        locationContainer.copyWith(location: location),
  );

  static final elevation = Lens<Poi, double?>(
    (elevationContainer) => elevationContainer.elevation,
    (elevationContainer, elevation) =>
        elevationContainer.copyWith(elevation: elevation),
  );

  static final types = Lens<Poi, List<String>?>(
    (typesContainer) => typesContainer.types,
    (typesContainer, types) => typesContainer.copyWith(types: types),
  );

  static final description = Lens<Poi, TextualDescription?>(
    (descriptionContainer) => descriptionContainer.description,
    (descriptionContainer, description) =>
        descriptionContainer.copyWith(description: description),
  );

  static final tags = Lens<Poi, List<String>?>(
    (tagsContainer) => tagsContainer.tags,
    (tagsContainer, tags) => tagsContainer.copyWith(tags: tags),
  );

  static final address = Lens<Poi, String?>(
    (addressContainer) => addressContainer.address,
    (addressContainer, address) => addressContainer.copyWith(address: address),
  );

  static final phoneNumber = Lens<Poi, String?>(
    (phoneNumberContainer) => phoneNumberContainer.phoneNumber,
    (phoneNumberContainer, phoneNumber) =>
        phoneNumberContainer.copyWith(phoneNumber: phoneNumber),
  );

  static final openingHours = Lens<Poi, String?>(
    (openingHoursContainer) => openingHoursContainer.openingHours,
    (openingHoursContainer, openingHours) =>
        openingHoursContainer.copyWith(openingHours: openingHours),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      id: json['id'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      elevation: (json['elevation'] as num?)?.toDouble(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] == null
          ? null
          : TextualDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      openingHours: json['openingHours'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'elevation': instance.elevation,
      'types': instance.types,
      'description': instance.description,
      'tags': instance.tags,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'openingHours': instance.openingHours,
    };
