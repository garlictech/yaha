import 'package:yaha/entities/hike/hike.dart';

abstract class HikeRepository {
  Future<List<Hike>> getHikeList();
}
