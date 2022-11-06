// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Weather {
  const $Weather();

  DateTime get when;
  String get type;

  Weather copyWith({
    DateTime? when,
    String? type,
  }) =>
      Weather(
        when: when ?? this.when,
        type: type ?? this.type,
      );

  Weather copyUsing(void Function(Weather$Change change) mutator) {
    final change = Weather$Change._(
      this.when,
      this.type,
    );
    mutator(change);
    return Weather(
      when: change.when,
      type: change.type,
    );
  }

  @override
  String toString() => "Weather(when: $when, type: $type)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Weather &&
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

class Weather$Change {
  Weather$Change._(
    this.when,
    this.type,
  );

  DateTime when;
  String type;
}

// ignore: avoid_classes_with_only_static_members
class Weather$ {
  static final when = Lens<Weather, DateTime>(
    (whenContainer) => whenContainer.when,
    (whenContainer, when) => whenContainer.copyWith(when: when),
  );

  static final type = Lens<Weather, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      when: DateTime.parse(json['when'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'when': instance.when.toIso8601String(),
      'type': instance.type,
    };
