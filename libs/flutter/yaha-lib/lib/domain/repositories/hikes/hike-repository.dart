import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';

import '../../entities/entities.dart';

abstract class HikeRepository {
  Future<List<String>> getHikeList();
  Future<HikeEntity> getHike(String id);
  Future<List<String>> searchHikeByRadius(SearchByRadiusInput input);
  Future<List<String>> searchHikeByContent(SearchByContentInput content);
  Future<List<String>> getRandomHikes(int limit);
  Future<List<Poi>> getOnroutePois(String id);
  Future<List<Poi>> getOffroutePois(String id);
}
