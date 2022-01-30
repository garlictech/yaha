import 'package:yaha/models/ModelProvider.dart';

abstract class HikeRepository {
  Future<List<Hike>> getHikeList();
}
