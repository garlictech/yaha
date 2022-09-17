import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/defaults-providers.dart';
import 'package:yaha/domain/domain.dart';

class HikingSettingsNotifier extends StateNotifier<HikingSettings> {
  HikingSettingsNotifier(double speed) : super(HikingSettings(speed: speed));
}

final hikingSettingsProvider = StateNotifierProvider.family<
    HikingSettingsNotifier, HikingSettings, String>((ref, hikeId) {
  final defaults = ref.watch(defaultsProvider);

  return HikingSettingsNotifier(defaults.averageSpeedKmh);
});
