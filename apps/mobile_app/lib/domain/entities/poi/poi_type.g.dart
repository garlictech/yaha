// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_type.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PoiType {
  const $PoiType();

  String get category;
  String get kind;

  PoiType copyWith({
    String? category,
    String? kind,
  }) =>
      PoiType(
        category: category ?? this.category,
        kind: kind ?? this.kind,
      );

  PoiType copyUsing(void Function(PoiType$Change change) mutator) {
    final change = PoiType$Change._(
      this.category,
      this.kind,
    );
    mutator(change);
    return PoiType(
      category: change.category,
      kind: change.kind,
    );
  }

  @override
  String toString() => "PoiType(category: $category, kind: $kind)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PoiType &&
      other.runtimeType == runtimeType &&
      category == other.category &&
      kind == other.kind;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + category.hashCode;
    result = 37 * result + kind.hashCode;
    return result;
  }
}

class PoiType$Change {
  PoiType$Change._(
    this.category,
    this.kind,
  );

  String category;
  String kind;
}

// ignore: avoid_classes_with_only_static_members
class PoiType$ {
  static final category = Lens<PoiType, String>(
    (categoryContainer) => categoryContainer.category,
    (categoryContainer, category) =>
        categoryContainer.copyWith(category: category),
  );

  static final kind = Lens<PoiType, String>(
    (kindContainer) => kindContainer.kind,
    (kindContainer, kind) => kindContainer.copyWith(kind: kind),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiType _$PoiTypeFromJson(Map<String, dynamic> json) => PoiType(
      category: json['category'] as String,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$PoiTypeToJson(PoiType instance) => <String, dynamic>{
      'category': instance.category,
      'kind': instance.kind,
    };
