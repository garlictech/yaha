import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'current_location_state.g.dart';

@riverpod
class CurrentLocationState extends _$CurrentLocationState {
  static const LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  static final locStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .debounceTime(const Duration(seconds: 3))
          .shareReplay(maxSize: 1);

  @override
  Position? build() {
    locStream.listen((Position? position) {
      state = position;
    });

    return null;
  }
}
