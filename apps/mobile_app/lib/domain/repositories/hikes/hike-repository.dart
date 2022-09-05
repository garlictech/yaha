import '../../entities/entities.dart';

abstract class HikeRepository {
  Future<List<Hike>> getHikeList();
  Future<Hike?> getHike(String id);
  Future<List<String>> searchHikeByRadius(SearchByRadiusInput input);
  Future<List<String>> searchHikeByContent(SearchByContentInput content);
}
