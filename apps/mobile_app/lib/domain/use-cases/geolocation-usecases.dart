import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yaha/providers/providers.dart';

class GeolocationUsecases {
  final ProviderReference ref;

  GeolocationUsecases({required this.ref});

  Future<Position> execute(String cityName) {
    return ref.read(geoLocationRepositoryProvider).getCurrentLocation();
  }
}
