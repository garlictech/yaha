import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search-safe-images-around-hike-input.g.dart';

@FunctionalData()
@JsonSerializable()
class SearchSafeImagesAroundHikeInput extends $SearchSafeImagesAroundHikeInput {
  @override
  final String hikeId;
  @override
  final double distanceInMeters;
  @override
  final int? limit;
  @override
  final String? nextToken;

  SearchSafeImagesAroundHikeInput(
      {required this.hikeId,
      required this.distanceInMeters,
      this.limit,
      this.nextToken});

  factory SearchSafeImagesAroundHikeInput.fromJson(Map<String, dynamic> json) =>
      _$SearchSafeImagesAroundHikeInputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchSafeImagesAroundHikeInputToJson(this);
}
