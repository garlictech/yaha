// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Poi {
  const $Poi();

  List<String> get imageUrls;

  Poi copyWith({
    List<String>? imageUrls,
  }) =>
      Poi(
        imageUrls: imageUrls ?? this.imageUrls,
      );

  Poi copyUsing(void Function(Poi$Change change) mutator) {
    final change = Poi$Change._(
      this.imageUrls,
    );
    mutator(change);
    return Poi(
      imageUrls: change.imageUrls,
    );
  }

  @override
  String toString() => "Poi(imageUrls: $imageUrls)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Poi &&
      other.runtimeType == runtimeType &&
      imageUrls == other.imageUrls;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return imageUrls.hashCode;
  }
}

class Poi$Change {
  Poi$Change._(
    this.imageUrls,
  );

  List<String> imageUrls;
}

// ignore: avoid_classes_with_only_static_members
class Poi$ {
  static final imageUrls = Lens<Poi, List<String>>(
    (imageUrlsContainer) => imageUrlsContainer.imageUrls,
    (imageUrlsContainer, imageUrls) =>
        imageUrlsContainer.copyWith(imageUrls: imageUrls),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'imageUrls': instance.imageUrls,
    };
