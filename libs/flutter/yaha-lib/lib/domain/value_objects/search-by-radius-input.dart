import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geo_point.dart';

part 'search-by-radius-input.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class SearchByRadiusInput extends $SearchByRadiusInput {
  @override
  final GeoPoint origin;
  @override
  final int radiusInMeters;
  @override
  final int? limit;
  @override
  final String? nextToken;

  SearchByRadiusInput(
      {required this.origin,
      required this.radiusInMeters,
      this.limit,
      this.nextToken});

  factory SearchByRadiusInput.fromJson(Map<String, dynamic> json) =>
      _$SearchByRadiusInputFromJson(json);

  Map<String, dynamic> toJson() => _$SearchByRadiusInputToJson(this);
}
