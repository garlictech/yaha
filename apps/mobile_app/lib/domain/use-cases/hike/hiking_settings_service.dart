import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/app/defaults-providers.dart';
import 'package:yaha/domain/entities/hike/hiking_settings.dart';
import 'package:yaha/domain/entities/poi/poi_type.dart';

part 'hiking_settings_service.g.dart';

@riverpod
class HikingSettingsService extends _$HikingSettingsService {
  @override
  HikingSettings build(String hikeId) {
    final defaults = ref.read(defaultsProvider);
    return HikingSettings(
        speed: defaults.averageSpeedKmh,
        reversedHike: false,
        startTime: DateTime.now());
  }

  setStartTime(DateTime time) {
    state = state.copyWith(startTime: time);
  }

  reverseHike() {
    state = state.copyWith(reversedHike: !state.reversedHike);
  }

  setFilteredPois(List<PoiType> poiTypes) {
    state =
        state.copyWith(filteredPoiTypes: poiTypes, showAllPoisAlongHike: false);
  }

  resetFilteredPois() {
    state =
        state.copyWith(filteredPoiTypes: const [], showAllPoisAlongHike: false);
  }

  showAllPoisAlongHike(bool toShow) {
    state = state
        .copyWith(showAllPoisAlongHike: toShow, filteredPoiTypes: const []);
  }
}
