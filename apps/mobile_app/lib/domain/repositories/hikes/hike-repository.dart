import 'package:dartz/dartz.dart';
import 'package:yaha/utils/failure.dart';

import '../../entities/entities.dart';

abstract class HikeRepository {
  Future<Either<Failure, List<Hike>>> getHikeList();
}
