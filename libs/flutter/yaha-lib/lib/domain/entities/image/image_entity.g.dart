// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $ImageEntity {
  const $ImageEntity();

  String? get id;
  String get original;
  String get card;
  String get thumbnail;
  String? get attributions;
  List<String>? get labels;

  ImageEntity copyWith({
    String? id,
    String? original,
    String? card,
    String? thumbnail,
    String? attributions,
    List<String>? labels,
  }) =>
      ImageEntity(
        id: id ?? this.id,
        original: original ?? this.original,
        card: card ?? this.card,
        thumbnail: thumbnail ?? this.thumbnail,
        attributions: attributions ?? this.attributions,
        labels: labels ?? this.labels,
      );

  ImageEntity copyUsing(void Function(ImageEntity$Change change) mutator) {
    final change = ImageEntity$Change._(
      this.id,
      this.original,
      this.card,
      this.thumbnail,
      this.attributions,
      this.labels,
    );
    mutator(change);
    return ImageEntity(
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
      "ImageEntity(id: $id, original: $original, card: $card, thumbnail: $thumbnail, attributions: $attributions, labels: $labels)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ImageEntity &&
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

class ImageEntity$Change {
  ImageEntity$Change._(
    this.id,
    this.original,
    this.card,
    this.thumbnail,
    this.attributions,
    this.labels,
  );

  String? id;
  String original;
  String card;
  String thumbnail;
  String? attributions;
  List<String>? labels;
}

// ignore: avoid_classes_with_only_static_members
class ImageEntity$ {
  static final id = Lens<ImageEntity, String?>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final original = Lens<ImageEntity, String>(
    (originalContainer) => originalContainer.original,
    (originalContainer, original) =>
        originalContainer.copyWith(original: original),
  );

  static final card = Lens<ImageEntity, String>(
    (cardContainer) => cardContainer.card,
    (cardContainer, card) => cardContainer.copyWith(card: card),
  );

  static final thumbnail = Lens<ImageEntity, String>(
    (thumbnailContainer) => thumbnailContainer.thumbnail,
    (thumbnailContainer, thumbnail) =>
        thumbnailContainer.copyWith(thumbnail: thumbnail),
  );

  static final attributions = Lens<ImageEntity, String?>(
    (attributionsContainer) => attributionsContainer.attributions,
    (attributionsContainer, attributions) =>
        attributionsContainer.copyWith(attributions: attributions),
  );

  static final labels = Lens<ImageEntity, List<String>?>(
    (labelsContainer) => labelsContainer.labels,
    (labelsContainer, labels) => labelsContainer.copyWith(labels: labels),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageEntity _$ImageEntityFromJson(Map<String, dynamic> json) => ImageEntity(
      id: json['id'] as String?,
      original: json['original'] as String,
      card: json['card'] as String,
      thumbnail: json['thumbnail'] as String,
      attributions: json['attributions'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImageEntityToJson(ImageEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['original'] = instance.original;
  val['card'] = instance.card;
  val['thumbnail'] = instance.thumbnail;
  writeNotNull('attributions', instance.attributions);
  writeNotNull('labels', instance.labels);
  return val;
}
