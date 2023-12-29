// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $WeatherEntity {
  const $WeatherEntity();

  DateTime get when;
  String get type;

  WeatherEntity copyWith({
    DateTime? when,
    String? type,
  }) =>
      WeatherEntity(
        when: when ?? this.when,
        type: type ?? this.type,
      );

  WeatherEntity copyUsing(void Function(WeatherEntity$Change change) mutator) {
    final change = WeatherEntity$Change._(
      this.when,
      this.type,
    );
    mutator(change);
    return WeatherEntity(
      when: change.when,
      type: change.type,
    );
  }

  @override
  String toString() => "WeatherEntity(when: $when, type: $type)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is WeatherEntity &&
      other.runtimeType == runtimeType &&
      when == other.when &&
      type == other.type;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + when.hashCode;
    result = 37 * result + type.hashCode;
    return result;
  }
}

class WeatherEntity$Change {
  WeatherEntity$Change._(
    this.when,
    this.type,
  );

  DateTime when;
  String type;
}

// ignore: avoid_classes_with_only_static_members
class WeatherEntity$ {
  static final when = Lens<WeatherEntity, DateTime>(
    (whenContainer) => whenContainer.when,
    (whenContainer, when) => whenContainer.copyWith(when: when),
  );

  static final type = Lens<WeatherEntity, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) =>
    WeatherEntity(
      when: DateTime.parse(json['when'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'when': instance.when.toIso8601String(),
      'type': instance.type,
    };
