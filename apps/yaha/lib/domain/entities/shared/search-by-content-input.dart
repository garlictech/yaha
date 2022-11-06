import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search-by-content-input.g.dart';

@FunctionalData()
@JsonSerializable()
class SearchByContentInput extends $SearchByContentInput {
  @override
  final String content;
  @override
  final int? limit;
  @override
  final String? nextToken;

  SearchByContentInput({required this.content, this.limit, this.nextToken});

  factory SearchByContentInput.fromJson(Map<String, dynamic> json) =>
      _$SearchByContentInputFromJson(json);

  Map<String, dynamic> toJson() => _$SearchByContentInputToJson(this);
}
