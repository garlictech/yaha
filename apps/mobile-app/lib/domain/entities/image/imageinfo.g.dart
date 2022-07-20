// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imageinfo.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Imageinfo {
  const $Imageinfo();

  String get url;
  int? get width;
  int? get height;

  Imageinfo copyWith({
    String? url,
    int? width,
    int? height,
  }) =>
      Imageinfo(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  Imageinfo copyUsing(void Function(Imageinfo$Change change) mutator) {
    final change = Imageinfo$Change._(
      this.url,
      this.width,
      this.height,
    );
    mutator(change);
    return Imageinfo(
      url: change.url,
      width: change.width,
      height: change.height,
    );
  }

  @override
  String toString() => "Imageinfo(url: $url, width: $width, height: $height)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Imageinfo &&
      other.runtimeType == runtimeType &&
      url == other.url &&
      width == other.width &&
      height == other.height;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + url.hashCode;
    result = 37 * result + width.hashCode;
    result = 37 * result + height.hashCode;
    return result;
  }
}

class Imageinfo$Change {
  Imageinfo$Change._(
    this.url,
    this.width,
    this.height,
  );

  String url;
  int? width;
  int? height;
}

// ignore: avoid_classes_with_only_static_members
class Imageinfo$ {
  static final url = Lens<Imageinfo, String>(
    (urlContainer) => urlContainer.url,
    (urlContainer, url) => urlContainer.copyWith(url: url),
  );

  static final width = Lens<Imageinfo, int?>(
    (widthContainer) => widthContainer.width,
    (widthContainer, width) => widthContainer.copyWith(width: width),
  );

  static final height = Lens<Imageinfo, int?>(
    (heightContainer) => heightContainer.height,
    (heightContainer, height) => heightContainer.copyWith(height: height),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Imageinfo _$ImageinfoFromJson(Map<String, dynamic> json) => Imageinfo(
      url: json['url'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$ImageinfoToJson(Imageinfo instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
