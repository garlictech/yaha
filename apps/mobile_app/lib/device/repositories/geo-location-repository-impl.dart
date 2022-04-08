import 'package:dartz/dartz.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/utils/failure.dart';

class GeoLocationRepositoryImpl implements GeoLocationRepository {
  @override
  Future<Either<Failure, GeoLocation>> getCurrentLocation() {
    return Future.value(const Right(GeoLocation(lat: 0, lon: 0, elevation: 0)));
  }
}
