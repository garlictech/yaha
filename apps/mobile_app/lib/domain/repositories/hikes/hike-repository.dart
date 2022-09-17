import '../../entities/entities.dart';

abstract class HikeRepository {
  Future<List<String>> getHikeList();
  Future<Hike> getHike(String id);
  Future<List<String>> searchHikeByRadius(SearchByRadiusInput input);
  Future<List<String>> searchHikeByContent(SearchByContentInput content);
  Future<List<Poi>> getOnroutePois(String id);
  Future<List<Poi>> getOffroutePois(String id);
}
