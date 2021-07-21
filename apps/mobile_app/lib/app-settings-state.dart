import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationSettingsState {
  bool isEnglish;
  bool isKm;
  bool isCelsius;
  bool isTimeFormat12;

  ApplicationSettingsState(
      {this.isEnglish = true,
      this.isKm = true,
      this.isCelsius = true,
      this.isTimeFormat12 = false});
}

class ApplicationSettingsStateNotifier
    extends StateNotifier<ApplicationSettingsState> {
  ApplicationSettingsStateNotifier() : super(ApplicationSettingsState());

  updateApplicationSettings(ApplicationSettingsState newState) =>
      state = newState;
}

final applicationSettingsStateProvider = StateNotifierProvider<
    ApplicationSettingsStateNotifier,
    ApplicationSettingsState>((_) => ApplicationSettingsStateNotifier());
