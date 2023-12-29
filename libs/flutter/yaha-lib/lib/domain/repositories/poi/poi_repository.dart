import '../../entities/entities.dart';

abstract class PoiRepository {
  Future<PoiEntity> getPoi(String id);
  Future<List<String>> searchPoiByRadius(SearchByRadiusInput input);
  Future<List<String>> searchPoiByContent(SearchByContentInput content);
}
