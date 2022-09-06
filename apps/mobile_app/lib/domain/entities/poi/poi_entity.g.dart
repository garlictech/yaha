// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Poi {
  const $Poi();

  String get id;
  String get type;
  List<Description>? get description;
  List<String>? get tags;
  String? get address;
  String? get phone;
  String? get openingHours;
  List<Image> get images;

  Poi copyWith({
    String? id,
    String? type,
    List<Description>? description,
    List<String>? tags,
    String? address,
    String? phone,
    String? openingHours,
    List<Image>? images,
  }) =>
      Poi(
        id: id ?? this.id,
        type: type ?? this.type,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        openingHours: openingHours ?? this.openingHours,
        images: images ?? this.images,
      );

  Poi copyUsing(void Function(Poi$Change change) mutator) {
    final change = Poi$Change._(
      this.id,
      this.type,
      this.description,
      this.tags,
      this.address,
      this.phone,
      this.openingHours,
      this.images,
    );
    mutator(change);
    return Poi(
      id: change.id,
      type: change.type,
      description: change.description,
      tags: change.tags,
      address: change.address,
      phone: change.phone,
      openingHours: change.openingHours,
      images: change.images,
    );
  }

  @override
  String toString() =>
      "Poi(id: $id, type: $type, description: $description, tags: $tags, address: $address, phone: $phone, openingHours: $openingHours, images: $images)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Poi &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      const Ignore().equals(type, other.type) &&
      const Ignore().equals(description, other.description) &&
      const Ignore().equals(tags, other.tags) &&
      const Ignore().equals(address, other.address) &&
      const Ignore().equals(phone, other.phone) &&
      const Ignore().equals(openingHours, other.openingHours) &&
      const Ignore().equals(images, other.images);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + const Ignore().hash(type);
    result = 37 * result + const Ignore().hash(description);
    result = 37 * result + const Ignore().hash(tags);
    result = 37 * result + const Ignore().hash(address);
    result = 37 * result + const Ignore().hash(phone);
    result = 37 * result + const Ignore().hash(openingHours);
    result = 37 * result + const Ignore().hash(images);
    return result;
  }
}

class Poi$Change {
  Poi$Change._(
    this.id,
    this.type,
    this.description,
    this.tags,
    this.address,
    this.phone,
    this.openingHours,
    this.images,
  );

  String id;
  String type;
  List<Description>? description;
  List<String>? tags;
  String? address;
  String? phone;
  String? openingHours;
  List<Image> images;
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

  static final description = Lens<Poi, List<Description>?>(
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

  static final phone = Lens<Poi, String?>(
    (phoneContainer) => phoneContainer.phone,
    (phoneContainer, phone) => phoneContainer.copyWith(phone: phone),
  );

  static final openingHours = Lens<Poi, String?>(
    (openingHoursContainer) => openingHoursContainer.openingHours,
    (openingHoursContainer, openingHours) =>
        openingHoursContainer.copyWith(openingHours: openingHours),
  );

  static final images = Lens<Poi, List<Image>>(
    (imagesContainer) => imagesContainer.images,
    (imagesContainer, images) => imagesContainer.copyWith(images: images),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      id: json['id'] as String,
      type: json['type'] as String? ?? "generic:unknown",
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingHours: json['openingHours'] as String?,
      phone: json['phone'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] as String?,
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
      'description', instance.description?.map((e) => e.toJson()).toList());
  writeNotNull('tags', instance.tags);
  writeNotNull('address', instance.address);
  writeNotNull('phone', instance.phone);
  writeNotNull('openingHours', instance.openingHours);
  val['images'] = instance.images.map((e) => e.toJson()).toList();
  return val;
}
