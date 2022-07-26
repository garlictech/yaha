// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagelabel.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Imagelabel {
  const $Imagelabel();

  String get label;
  double get confidence;

  Imagelabel copyWith({
    String? label,
    double? confidence,
  }) =>
      Imagelabel(
        label: label ?? this.label,
        confidence: confidence ?? this.confidence,
      );

  Imagelabel copyUsing(void Function(Imagelabel$Change change) mutator) {
    final change = Imagelabel$Change._(
      this.label,
      this.confidence,
    );
    mutator(change);
    return Imagelabel(
      label: change.label,
      confidence: change.confidence,
    );
  }

  @override
  String toString() => "Imagelabel(label: $label, confidence: $confidence)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Imagelabel &&
      other.runtimeType == runtimeType &&
      label == other.label &&
      confidence == other.confidence;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + label.hashCode;
    result = 37 * result + confidence.hashCode;
    return result;
  }
}

class Imagelabel$Change {
  Imagelabel$Change._(
    this.label,
    this.confidence,
  );

  String label;
  double confidence;
}

// ignore: avoid_classes_with_only_static_members
class Imagelabel$ {
  static final label = Lens<Imagelabel, String>(
    (labelContainer) => labelContainer.label,
    (labelContainer, label) => labelContainer.copyWith(label: label),
  );

  static final confidence = Lens<Imagelabel, double>(
    (confidenceContainer) => confidenceContainer.confidence,
    (confidenceContainer, confidence) =>
        confidenceContainer.copyWith(confidence: confidence),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Imagelabel _$ImagelabelFromJson(Map<String, dynamic> json) => Imagelabel(
      label: json['label'] as String,
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$ImagelabelToJson(Imagelabel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'confidence': instance.confidence,
    };
