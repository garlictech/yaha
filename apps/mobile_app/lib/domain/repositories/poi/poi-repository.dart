import '../../entities/entities.dart';

abstract class PoiRepository {
  Future<Poi?> getPoi(String id);
  Future<List<String>> searchPoiByRadius(SearchByRadiusInput input);
  Future<List<String>> searchPoiByContent(SearchByContentInput content);
}
