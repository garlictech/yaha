import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'current_location_state.g.dart';

@riverpod
class CurrentLocationState extends _$CurrentLocationState {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  @override
  Position? build() {
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .debounceTime(const Duration(seconds: 3))
        .listen((Position? position) {
      state = position;
    });

    return null;
  }
}
