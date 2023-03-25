import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/defaults-providers.dart';
import 'package:yaha/domain/entities/hike/hiking-settings.dart';

class HikingSettingsNotifier extends StateNotifier<HikingSettings> {
  HikingSettingsNotifier(double speed)
      : super(HikingSettings(speed: speed, startTime: DateTime.now()));

  setStartTime(DateTime time) {
    state = state.copyWith(startTime: time);
  }
}

final hikingSettingsProvider =
    StateNotifierProvider<HikingSettingsNotifier, HikingSettings>((ref) {
  final defaults = ref.watch(defaultsProvider);

  return HikingSettingsNotifier(defaults.averageSpeedKmh);
});
