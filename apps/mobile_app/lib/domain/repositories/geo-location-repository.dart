import 'package:dartz/dartz.dart';
import 'package:yaha/utils/failure.dart';

import '../entities/shared/geolocation.dart';

abstract class GeoLocationRepository {
  Future<Either<Failure, GeoLocation>> getCurrentLocation();
}
