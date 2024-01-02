import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_location_service.g.dart';

@riverpod
Future<GeoLocation> currentLocationService(CurrentLocationServiceRef ref) {
  return ref.watch(geoLocationRepositoryProvider).getCurrentLocation();
}
