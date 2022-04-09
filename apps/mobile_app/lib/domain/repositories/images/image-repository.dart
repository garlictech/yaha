import '../../entities/entities.dart';

abstract class ImageRepository {
  Future<Image> getImage(String id);
  Future<List<String>> searchImagesAroundHike(
      SearchSafeImagesAroundHikeInput input);
}
