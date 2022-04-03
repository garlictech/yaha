import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../utils/failure.dart';

abstract class HikeRepository {
  Future<Either<Failure, List<Hike>>> getHikeList();
  Future<Either<Failure, List<Image>>> searchImagesAroundHike(
      SearchAroundHikeInput input);
}
