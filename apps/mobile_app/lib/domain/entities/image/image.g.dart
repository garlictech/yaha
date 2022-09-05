// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Image {
  const $Image();

  String get id;
  Location get location;
  Imageinfo get original;
  Imageinfo get card;
  Imageinfo get thumbnail;
  PoiSourceObject? get sourceObject;
  String? get attributions;
  List<Imagelabel>? get labels;
  bool? get banned;

  Image copyWith({
    String? id,
    Location? location,
    Imageinfo? original,
    Imageinfo? card,
    Imageinfo? thumbnail,
    PoiSourceObject? sourceObject,
    String? attributions,
    List<Imagelabel>? labels,
    bool? banned,
  }) =>
      Image(
        id: id ?? this.id,
        location: location ?? this.location,
        original: original ?? this.original,
        card: card ?? this.card,
        thumbnail: thumbnail ?? this.thumbnail,
        sourceObject: sourceObject ?? this.sourceObject,
        attributions: attributions ?? this.attributions,
        labels: labels ?? this.labels,
        banned: banned ?? this.banned,
      );

  Image copyUsing(void Function(Image$Change change) mutator) {
    final change = Image$Change._(
      this.id,
      this.location,
      this.original,
      this.card,
      this.thumbnail,
      this.sourceObject,
      this.attributions,
      this.labels,
      this.banned,
    );
    mutator(change);
    return Image(
      id: change.id,
      location: change.location,
      original: change.original,
      card: change.card,
      thumbnail: change.thumbnail,
      sourceObject: change.sourceObject,
      attributions: change.attributions,
      labels: change.labels,
      banned: change.banned,
    );
  }

  @override
  String toString() =>
      "Image(id: $id, location: $location, original: $original, card: $card, thumbnail: $thumbnail, sourceObject: $sourceObject, attributions: $attributions, labels: $labels, banned: $banned)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Image &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      location == other.location &&
      original == other.original &&
      card == other.card &&
      thumbnail == other.thumbnail &&
      sourceObject == other.sourceObject &&
      attributions == other.attributions &&
      labels == other.labels &&
      banned == other.banned;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + location.hashCode;
    result = 37 * result + original.hashCode;
    result = 37 * result + card.hashCode;
    result = 37 * result + thumbnail.hashCode;
    result = 37 * result + sourceObject.hashCode;
    result = 37 * result + attributions.hashCode;
    result = 37 * result + labels.hashCode;
    result = 37 * result + banned.hashCode;
    return result;
  }
}

class Image$Change {
  Image$Change._(
    this.id,
    this.location,
    this.original,
    this.card,
    this.thumbnail,
    this.sourceObject,
    this.attributions,
    this.labels,
    this.banned,
  );

  String id;
  Location location;
  Imageinfo original;
  Imageinfo card;
  Imageinfo thumbnail;
  PoiSourceObject? sourceObject;
  String? attributions;
  List<Imagelabel>? labels;
  bool? banned;
}

// ignore: avoid_classes_with_only_static_members
class Image$ {
  static final id = Lens<Image, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final location = Lens<Image, Location>(
    (locationContainer) => locationContainer.location,
    (locationContainer, location) =>
        locationContainer.copyWith(location: location),
  );

  static final original = Lens<Image, Imageinfo>(
    (originalContainer) => originalContainer.original,
    (originalContainer, original) =>
        originalContainer.copyWith(original: original),
  );

  static final card = Lens<Image, Imageinfo>(
    (cardContainer) => cardContainer.card,
    (cardContainer, card) => cardContainer.copyWith(card: card),
  );

  static final thumbnail = Lens<Image, Imageinfo>(
    (thumbnailContainer) => thumbnailContainer.thumbnail,
    (thumbnailContainer, thumbnail) =>
        thumbnailContainer.copyWith(thumbnail: thumbnail),
  );

  static final sourceObject = Lens<Image, PoiSourceObject?>(
    (sourceObjectContainer) => sourceObjectContainer.sourceObject,
    (sourceObjectContainer, sourceObject) =>
        sourceObjectContainer.copyWith(sourceObject: sourceObject),
  );

  static final attributions = Lens<Image, String?>(
    (attributionsContainer) => attributionsContainer.attributions,
    (attributionsContainer, attributions) =>
        attributionsContainer.copyWith(attributions: attributions),
  );

  static final labels = Lens<Image, List<Imagelabel>?>(
    (labelsContainer) => labelsContainer.labels,
    (labelsContainer, labels) => labelsContainer.copyWith(labels: labels),
  );

  static final banned = Lens<Image, bool?>(
    (bannedContainer) => bannedContainer.banned,
    (bannedContainer, banned) => bannedContainer.copyWith(banned: banned),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      original: Imageinfo.fromJson(json['original'] as Map<String, dynamic>),
      card: Imageinfo.fromJson(json['card'] as Map<String, dynamic>),
      thumbnail: Imageinfo.fromJson(json['thumbnail'] as Map<String, dynamic>),
      sourceObject: json['sourceObject'] == null
          ? null
          : PoiSourceObject.fromJson(
              json['sourceObject'] as Map<String, dynamic>),
      attributions: json['attributions'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Imagelabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      banned: json['banned'] as bool?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'location': instance.location.toJson(),
    'original': instance.original.toJson(),
    'card': instance.card.toJson(),
    'thumbnail': instance.thumbnail.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceObject', instance.sourceObject?.toJson());
  writeNotNull('attributions', instance.attributions);
  writeNotNull('labels', instance.labels?.map((e) => e.toJson()).toList());
  writeNotNull('banned', instance.banned);
  return val;
}
