import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/location.dart';

part 'search-hike-by-radius-input.g.dart';

@FunctionalData()
@JsonSerializable()
class SearchHikeByRadiusInput extends $SearchHikeByRadiusInput {
  @override
  final Location location;
  @override
  final double radiusInMeters;
  @override
  final int? limit;
  @override
  final String? nextToken;

  SearchHikeByRadiusInput(
      {required this.location,
      required this.radiusInMeters,
      this.limit,
      this.nextToken});

  factory SearchHikeByRadiusInput.fromJson(Map<String, dynamic> json) =>
      _$SearchHikeByRadiusInputFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHikeByRadiusInputToJson(this);
}
