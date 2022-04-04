// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textual-description.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $TextualDescription {
  const $TextualDescription();

  String get languageKey;
  String? get title;
  String? get summary;
  String? get fullDescription;
  String get type;

  TextualDescription copyWith({
    String? languageKey,
    String? title,
    String? summary,
    String? fullDescription,
    String? type,
  }) =>
      TextualDescription(
        languageKey: languageKey ?? this.languageKey,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        fullDescription: fullDescription ?? this.fullDescription,
        type: type ?? this.type,
      );

  TextualDescription copyUsing(
      void Function(TextualDescription$Change change) mutator) {
    final change = TextualDescription$Change._(
      this.languageKey,
      this.title,
      this.summary,
      this.fullDescription,
      this.type,
    );
    mutator(change);
    return TextualDescription(
      languageKey: change.languageKey,
      title: change.title,
      summary: change.summary,
      fullDescription: change.fullDescription,
      type: change.type,
    );
  }

  @override
  String toString() =>
      "TextualDescription(languageKey: $languageKey, title: $title, summary: $summary, fullDescription: $fullDescription, type: $type)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is TextualDescription &&
      other.runtimeType == runtimeType &&
      languageKey == other.languageKey &&
      title == other.title &&
      summary == other.summary &&
      fullDescription == other.fullDescription &&
      type == other.type;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + languageKey.hashCode;
    result = 37 * result + title.hashCode;
    result = 37 * result + summary.hashCode;
    result = 37 * result + fullDescription.hashCode;
    result = 37 * result + type.hashCode;
    return result;
  }
}

class TextualDescription$Change {
  TextualDescription$Change._(
    this.languageKey,
    this.title,
    this.summary,
    this.fullDescription,
    this.type,
  );

  String languageKey;
  String? title;
  String? summary;
  String? fullDescription;
  String type;
}

// ignore: avoid_classes_with_only_static_members
class TextualDescription$ {
  static final languageKey = Lens<TextualDescription, String>(
    (languageKeyContainer) => languageKeyContainer.languageKey,
    (languageKeyContainer, languageKey) =>
        languageKeyContainer.copyWith(languageKey: languageKey),
  );

  static final title = Lens<TextualDescription, String?>(
    (titleContainer) => titleContainer.title,
    (titleContainer, title) => titleContainer.copyWith(title: title),
  );

  static final summary = Lens<TextualDescription, String?>(
    (summaryContainer) => summaryContainer.summary,
    (summaryContainer, summary) => summaryContainer.copyWith(summary: summary),
  );

  static final fullDescription = Lens<TextualDescription, String?>(
    (fullDescriptionContainer) => fullDescriptionContainer.fullDescription,
    (fullDescriptionContainer, fullDescription) =>
        fullDescriptionContainer.copyWith(fullDescription: fullDescription),
  );

  static final type = Lens<TextualDescription, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextualDescription _$TextualDescriptionFromJson(Map<String, dynamic> json) =>
    TextualDescription(
      languageKey: json['languageKey'] as String,
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      fullDescription: json['fullDescription'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TextualDescriptionToJson(TextualDescription instance) =>
    <String, dynamic>{
      'languageKey': instance.languageKey,
      'title': instance.title,
      'summary': instance.summary,
      'fullDescription': instance.fullDescription,
      'type': instance.type,
    };
