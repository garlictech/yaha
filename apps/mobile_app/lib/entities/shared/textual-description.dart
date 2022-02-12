import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'textual-description.g.dart';

@FunctionalData()
@JsonSerializable()
class TextualDescription extends $TextualDescription {
  @override
  final String languageKey;
  @override
  final String? title;
  @override
  final String? summary;
  @override
  final String? fullDescription;
  @override
  final String type;

  TextualDescription(
      {required this.languageKey,
      this.title,
      this.summary,
      this.fullDescription,
      required this.type});

  factory TextualDescription.fromJson(Map<String, dynamic> json) =>
      _$TextualDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$TextualDescriptionToJson(this);
}
