import '../../entities/entities.dart';
import '../../value_objects/value_objects.dart';

abstract class ImageRepository {
  Future<ImageEntity?> getImage(String id);
  Future<List<String>> searchImagesAroundHike(
      SearchSafeImagesAroundHikeInput input);
  Future<List<String>> searchImagesAroundLocation(SearchByRadiusInput input);
}
