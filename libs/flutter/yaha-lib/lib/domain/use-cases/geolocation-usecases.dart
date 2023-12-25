import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_yaha_lib/app/providers.dart';

class GeolocationUsecases {
  final Ref ref;

  GeolocationUsecases({required this.ref});

  Future<Position> execute(String cityName) {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation();
  }
}
