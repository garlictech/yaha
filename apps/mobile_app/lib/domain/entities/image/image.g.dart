// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Image {
  const $Image();

  String get id;
  String get original;
  String get card;
  String get thumbnail;
  String? get attributions;
  List<Imagelabel>? get labels;

  Image copyWith({
    String? id,
    String? original,
    String? card,
    String? thumbnail,
    String? attributions,
    List<Imagelabel>? labels,
  }) =>
      Image(
        id: id ?? this.id,
        original: original ?? this.original,
        card: card ?? this.card,
        thumbnail: thumbnail ?? this.thumbnail,
        attributions: attributions ?? this.attributions,
        labels: labels ?? this.labels,
      );

  Image copyUsing(void Function(Image$Change change) mutator) {
    final change = Image$Change._(
      this.id,
      this.original,
      this.card,
      this.thumbnail,
      this.attributions,
      this.labels,
    );
    mutator(change);
    return Image(
      id: change.id,
      original: change.original,
      card: change.card,
      thumbnail: change.thumbnail,
      attributions: change.attributions,
      labels: change.labels,
    );
  }

  @override
  String toString() =>
      "Image(id: $id, original: $original, card: $card, thumbnail: $thumbnail, attributions: $attributions, labels: $labels)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Image &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      original == other.original &&
      card == other.card &&
      thumbnail == other.thumbnail &&
      attributions == other.attributions &&
      labels == other.labels;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + original.hashCode;
    result = 37 * result + card.hashCode;
    result = 37 * result + thumbnail.hashCode;
    result = 37 * result + attributions.hashCode;
    result = 37 * result + labels.hashCode;
    return result;
  }
}

class Image$Change {
  Image$Change._(
    this.id,
    this.original,
    this.card,
    this.thumbnail,
    this.attributions,
    this.labels,
  );

  String id;
  String original;
  String card;
  String thumbnail;
  String? attributions;
  List<Imagelabel>? labels;
}

// ignore: avoid_classes_with_only_static_members
class Image$ {
  static final id = Lens<Image, String>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final original = Lens<Image, String>(
    (originalContainer) => originalContainer.original,
    (originalContainer, original) =>
        originalContainer.copyWith(original: original),
  );

  static final card = Lens<Image, String>(
    (cardContainer) => cardContainer.card,
    (cardContainer, card) => cardContainer.copyWith(card: card),
  );

  static final thumbnail = Lens<Image, String>(
    (thumbnailContainer) => thumbnailContainer.thumbnail,
    (thumbnailContainer, thumbnail) =>
        thumbnailContainer.copyWith(thumbnail: thumbnail),
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
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String,
      original: json['original'] as String,
      card: json['card'] as String,
      thumbnail: json['thumbnail'] as String,
      attributions: json['attributions'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Imagelabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageToJson(Image instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'original': instance.original,
    'card': instance.card,
    'thumbnail': instance.thumbnail,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributions', instance.attributions);
  writeNotNull('labels', instance.labels?.map((e) => e.toJson()).toList());
  return val;
}
