import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search-around-hike-input.g.dart';

@FunctionalData()
@JsonSerializable()
class SearchAroundHikeInput extends $SearchAroundHikeInput {
  @override
  final String hikeId;
  @override
  final double distanceInMeters;
  @override
  final String objectType;
  @override
  final int? limit;
  @override
  final String? nextToken;

  SearchAroundHikeInput(
      {required this.hikeId,
      required this.distanceInMeters,
      required this.objectType,
      this.limit,
      this.nextToken});

  factory SearchAroundHikeInput.fromJson(Map<String, dynamic> json) =>
      _$SearchAroundHikeInputFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAroundHikeInputToJson(this);
}
