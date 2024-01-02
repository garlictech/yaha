import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'current_location_stream.g.dart';

@riverpod
Stream<GeoLocation> currentLocationStream(CurrentLocationStreamRef ref) {
  return ref
      .watch(geoLocationRepositoryProvider)
      .watchCurrentLocation()
      .throttleTime(const Duration(seconds: 3), leading: true)
      .shareReplay(maxSize: 1);
}
