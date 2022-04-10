import '../../entities/entities.dart';

abstract class PoiRepository {
  Future<Poi> getPoi(String id);
  Future<List<String>> searchPoisAroundHike(SearchAroundHikeInput input);
}
