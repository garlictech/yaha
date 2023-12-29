import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hiking_settings_service.g.dart';

@riverpod
class HikingSettingsService extends _$HikingSettingsService {
  @override
  HikingSettingsEntity build(String hikeId) {
    final defaults = ref.read(defaultsProvider);
    return HikingSettingsEntity(
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

  togglePoisAroundHike() {
    state = state.copyWith(showPoisAroundHike: !state.showAllPoisAlongHike);
  }
}
