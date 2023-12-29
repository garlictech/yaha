import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@FunctionalData()
@JsonSerializable()
class Description extends $Description {
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

  Description(
      {required this.languageKey,
      this.title,
      this.summary,
      this.fullDescription,
      required this.type});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
