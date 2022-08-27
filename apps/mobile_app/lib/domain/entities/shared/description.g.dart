// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Description {
  const $Description();

  String get languageKey;
  String? get title;
  String? get summary;
  String? get fullDescription;
  String get type;

  Description copyWith({
    String? languageKey,
    String? title,
    String? summary,
    String? fullDescription,
    String? type,
  }) =>
      Description(
        languageKey: languageKey ?? this.languageKey,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        fullDescription: fullDescription ?? this.fullDescription,
        type: type ?? this.type,
      );

  Description copyUsing(void Function(Description$Change change) mutator) {
    final change = Description$Change._(
      this.languageKey,
      this.title,
      this.summary,
      this.fullDescription,
      this.type,
    );
    mutator(change);
    return Description(
      languageKey: change.languageKey,
      title: change.title,
      summary: change.summary,
      fullDescription: change.fullDescription,
      type: change.type,
    );
  }

  @override
  String toString() =>
      "Description(languageKey: $languageKey, title: $title, summary: $summary, fullDescription: $fullDescription, type: $type)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Description &&
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

class Description$Change {
  Description$Change._(
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
class Description$ {
  static final languageKey = Lens<Description, String>(
    (languageKeyContainer) => languageKeyContainer.languageKey,
    (languageKeyContainer, languageKey) =>
        languageKeyContainer.copyWith(languageKey: languageKey),
  );

  static final title = Lens<Description, String?>(
    (titleContainer) => titleContainer.title,
    (titleContainer, title) => titleContainer.copyWith(title: title),
  );

  static final summary = Lens<Description, String?>(
    (summaryContainer) => summaryContainer.summary,
    (summaryContainer, summary) => summaryContainer.copyWith(summary: summary),
  );

  static final fullDescription = Lens<Description, String?>(
    (fullDescriptionContainer) => fullDescriptionContainer.fullDescription,
    (fullDescriptionContainer, fullDescription) =>
        fullDescriptionContainer.copyWith(fullDescription: fullDescription),
  );

  static final type = Lens<Description, String>(
    (typeContainer) => typeContainer.type,
    (typeContainer, type) => typeContainer.copyWith(type: type),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      languageKey: json['languageKey'] as String,
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      fullDescription: json['fullDescription'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'languageKey': instance.languageKey,
      'title': instance.title,
      'summary': instance.summary,
      'fullDescription': instance.fullDescription,
      'type': instance.type,
    };
