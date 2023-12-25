import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search-safe-images-around-hike-input.g.dart';

@FunctionalData()
@JsonSerializable()
class SearchSafeImagesAroundHikeInput extends $SearchSafeImagesAroundHikeInput {
  @override
  final String hikeId;
  @override
  final int distanceInMeters;

  SearchSafeImagesAroundHikeInput(
      {required this.hikeId, required this.distanceInMeters});

  factory SearchSafeImagesAroundHikeInput.fromJson(Map<String, dynamic> json) =>
      _$SearchSafeImagesAroundHikeInputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchSafeImagesAroundHikeInputToJson(this);
}
