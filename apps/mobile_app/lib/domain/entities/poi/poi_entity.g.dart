// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Poi {
  const $Poi();

  String get id;
  String get type;
  List<Description>? get descriptions;
  List<String>? get tags;
  String? get address;
  String? get phone;
  String? get openingHours;
  String? get infoUrl;
  List<Image> get images;
  Waypoint get location;

  Poi copyWith({
    String? id,
    String? type,
    List<Description>? descriptions,
    List<String>? tags,
    String? address,
    String? phone,
    String? openingHours,
    String? infoUrl,
    List<Image>? images,
    Waypoint? location,
  }) =>
      Poi(
        id: id ?? this.id,
        type: type ?? this.type,
        descriptions: descriptions ?? this.descriptions,
        tags: tags ?? this.tags,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        openingHours: openingHours ?? this.openingHours,
        infoUrl: infoUrl ?? this.infoUrl,
        images: images ?? this.images,
        location: location ?? this.location,
      );

  Poi copyUsing(void Function(Poi$Change change) mutator) {
    final change = Poi$Change._(
      this.id,
      this.type,
      this.descriptions,
      this.tags,
      this.address,
      this.phone,
      this.openingHours,
      this.infoUrl,
      this.images,
      this.location,
    );
    mutator(change);
    return Poi(
      id: change.id,
      type: change.type,
      descriptions: change.descriptions,
      tags: change.tags,
      address: change.address,
      phone: change.phone,
      openingHours: change.openingHours,
      infoUrl: change.infoUrl,
      images: change.images,
      location: change.location,
    );
  }

  @override
  String toString() =>
      "Poi(id: $id, type: $type, descriptions: $descriptions, tags: $tags, address: $address, phone: $phone, openingHours: $openingHours, infoUrl: $infoUrl, images: $images, location: $location)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Poi &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      const Ignore().equals(type, other.type) &&
      const Ignore().equals(descriptions, other.descriptions) &&
      const Ignore().equals(tags, other.tags) &&
      const Ignore().equals(address, other.address) &&
      const Ignore().equals(phone, other.phone) &&
      const Ignore().equals(openingHours, other.openingHours) &&
      const Ignore().equals(infoUrl, other.infoUrl) &&
      const Ignore().equals(images, other.images) &&
      const Ignore().equals(location, other.location);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + const Ignore().hash(type);
    result = 37 * result + const Ignore().hash(descriptions);
    result = 37 * result + const Ignore().hash(tags);
    result = 37 * result + const Ignore().hash(address);
    result = 37 * result + const Ignore().hash(phone);
    result = 37 * result + const Ignore().hash(openingHours);
    result = 37 * result + const Ignore().hash(infoUrl);
    result = 37 * result + const Ignore().hash(images);
    result = 37 * result + const Ignore().hash(location);
    return result;
  }
}

class Poi$Change {
  Poi$Change._(
    this.id,
    this.type,
    this.descriptions,
    this.tags,
    this.address,
    this.phone,
    this.openingHours,
    this.infoUrl,
    this.images,
    this.location,
  );

  String id;
  String type;
  List<Description>? descriptions;
  List<String>? tags;
  String? address;
  String? phone;
  String? openingHours;
  String? infoUrl;
  List<Image> images;
  Waypoint location;
}

// ignore: avoid_classes_with_only_static_members
class Poi$ {
  static final id = Lens<Poi, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final type = Lens<Poi, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );

  static final descriptions = Lens<Poi, List<Description>?>(
    (descriptionsContainer) => descriptionsContainer.descriptions,
    (descriptionsContainer, descriptions) =>
        descriptionsContainer.copyWith(descriptions: descriptions),
  );

  static final tags = Lens<Poi, List<String>?>(
    (tagsContainer) => tagsContainer.tags,
    (tagsContainer, tags) => tagsContainer.copyWith(tags: tags),
  );

  static final address = Lens<Poi, String?>(
    (addressContainer) => addressContainer.address,
    (addressContainer, address) => addressContainer.copyWith(address: address),
  );

  static final phone = Lens<Poi, String?>(
    (phoneContainer) => phoneContainer.phone,
    (phoneContainer, phone) => phoneContainer.copyWith(phone: phone),
  );

  static final openingHours = Lens<Poi, String?>(
    (openingHoursContainer) => openingHoursContainer.openingHours,
    (openingHoursContainer, openingHours) =>
        openingHoursContainer.copyWith(openingHours: openingHours),
  );

  static final infoUrl = Lens<Poi, String?>(
    (infoUrlContainer) => infoUrlContainer.infoUrl,
    (infoUrlContainer, infoUrl) => infoUrlContainer.copyWith(infoUrl: infoUrl),
  );

  static final images = Lens<Poi, List<Image>>(
    (imagesContainer) => imagesContainer.images,
    (imagesContainer, images) => imagesContainer.copyWith(images: images),
  );

  static final location = Lens<Poi, Waypoint>(
    (locationContainer) => locationContainer.location,
    (locationContainer, location) =>
        locationContainer.copyWith(location: location),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      id: json['id'] as String,
      type: json['type'] as String? ?? "generic:unknown",
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingHours: json['openingHours'] as String?,
      phone: json['phone'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] as String?,
      infoUrl: json['infoUrl'] as String?,
      location: Waypoint.fromJson(json['location'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PoiToJson(Poi instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'descriptions', instance.descriptions?.map((e) => e.toJson()).toList());
  writeNotNull('tags', instance.tags);
  writeNotNull('address', instance.address);
  writeNotNull('phone', instance.phone);
  writeNotNull('openingHours', instance.openingHours);
  writeNotNull('infoUrl', instance.infoUrl);
  val['images'] = instance.images.map((e) => e.toJson()).toList();
  val['location'] = instance.location.toJson();
  return val;
}
