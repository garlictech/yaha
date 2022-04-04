import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/providers/providers.dart';

import '../entities/entities.dart';
import '../utils/failure.dart';

class GeolocationUsecases {
  final ProviderReference ref;

  GeolocationUsecases({required this.ref});

  Future<Either<Failure, GeoLocation>> execute(String cityName) {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation();
  }
}
