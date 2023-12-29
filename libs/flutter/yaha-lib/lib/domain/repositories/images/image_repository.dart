import 'package:flutter_yaha_lib/domain/entities/image/image_entity.dart';
import 'package:flutter_yaha_lib/domain/entities/value_objects/search-by-radius-input.dart';
import 'package:flutter_yaha_lib/domain/entities/value_objects/search-safe-images-around-hike-input.dart';

abstract class ImageRepository {
  Future<ImageEntity?> getImage(String id);
  Future<List<String>> searchImagesAroundHike(
      SearchSafeImagesAroundHikeInput input);
  Future<List<String>> searchImagesAroundLocation(SearchByRadiusInput input);
}
