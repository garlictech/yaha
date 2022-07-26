import '../../entities/entities.dart';

abstract class PoiRepository {
  Future<Poi?> getPoi(String id);
  Stream<List<String>> searchPoisAroundHike(SearchAroundHikeInput input);
}
