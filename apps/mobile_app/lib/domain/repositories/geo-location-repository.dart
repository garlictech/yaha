import 'package:dartz/dartz.dart';

import '../entities/shared/geolocation.dart';
import '../utils/failure.dart';

abstract class GeoLocationRepository {
  Future<Either<Failure, GeoLocation>> getCurrentLocation();
}
