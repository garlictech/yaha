// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poisourceobject.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PoiSourceObject {
  const $PoiSourceObject();

  String get objectType;
  String? get languageKey;
  String get objectId;
  String? get url;

  PoiSourceObject copyWith({
    String? objectType,
    String? languageKey,
    String? objectId,
    String? url,
  }) =>
      PoiSourceObject(
        objectType: objectType ?? this.objectType,
        languageKey: languageKey ?? this.languageKey,
        objectId: objectId ?? this.objectId,
        url: url ?? this.url,
      );

  PoiSourceObject copyUsing(
      void Function(PoiSourceObject$Change change) mutator) {
    final change = PoiSourceObject$Change._(
      this.objectType,
      this.languageKey,
      this.objectId,
      this.url,
    );
    mutator(change);
    return PoiSourceObject(
      objectType: change.objectType,
      languageKey: change.languageKey,
      objectId: change.objectId,
      url: change.url,
    );
  }

  @override
  String toString() =>
      "PoiSourceObject(objectType: $objectType, languageKey: $languageKey, objectId: $objectId, url: $url)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PoiSourceObject &&
      other.runtimeType == runtimeType &&
      objectType == other.objectType &&
      languageKey == other.languageKey &&
      objectId == other.objectId &&
      url == other.url;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + objectType.hashCode;
    result = 37 * result + languageKey.hashCode;
    result = 37 * result + objectId.hashCode;
    result = 37 * result + url.hashCode;
    return result;
  }
}

class PoiSourceObject$Change {
  PoiSourceObject$Change._(
    this.objectType,
    this.languageKey,
    this.objectId,
    this.url,
  );

  String objectType;
  String? languageKey;
  String objectId;
  String? url;
}

// ignore: avoid_classes_with_only_static_members
class PoiSourceObject$ {
  static final objectType = Lens<PoiSourceObject, String>(
    (objectTypeContainer) => objectTypeContainer.objectType,
    (objectTypeContainer, objectType) =>
        objectTypeContainer.copyWith(objectType: objectType),
  );

  static final languageKey = Lens<PoiSourceObject, String?>(
    (languageKeyContainer) => languageKeyContainer.languageKey,
    (languageKeyContainer, languageKey) =>
        languageKeyContainer.copyWith(languageKey: languageKey),
  );

  static final objectId = Lens<PoiSourceObject, String>(
    (objectIdContainer) => objectIdContainer.objectId,
    (objectIdContainer, objectId) =>
        objectIdContainer.copyWith(objectId: objectId),
  );

  static final url = Lens<PoiSourceObject, String?>(
    (urlContainer) => urlContainer.url,
    (urlContainer, url) => urlContainer.copyWith(url: url),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiSourceObject _$PoiSourceObjectFromJson(Map<String, dynamic> json) =>
    PoiSourceObject(
      objectType: json['objectType'] as String,
      languageKey: json['languageKey'] as String?,
      objectId: json['objectId'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PoiSourceObjectToJson(PoiSourceObject instance) {
  final val = <String, dynamic>{
    'objectType': instance.objectType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('languageKey', instance.languageKey);
  val['objectId'] = instance.objectId;
  writeNotNull('url', instance.url);
  return val;
}
