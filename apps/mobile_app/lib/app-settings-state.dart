import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';

part 'app-settings-state.g.dart';

@FunctionalData()
class ApplicationSettingsState extends $ApplicationSettingsState {
  final bool isEnglish;
  final bool isKm;
  final bool isCelsius;
  final bool isTimeFormat24;
  final int distanceInitialIndex;
  final int temperatureInitialIndex;
  final int timeFormatInitialIndex;
  final String currentLanguageTitle;

  ApplicationSettingsState(
      {this.isEnglish = true,
      this.isKm = true,
      this.isCelsius = true,
      this.isTimeFormat24 = true,
      this.distanceInitialIndex = 0,
      this.temperatureInitialIndex = 0,
      this.timeFormatInitialIndex = 1,
      this.currentLanguageTitle = 'English'});
}

class ApplicationSettingsStateNotifier
    extends StateNotifier<ApplicationSettingsState> {
  ApplicationSettingsStateNotifier() : super(ApplicationSettingsState());

  updateLanguage(bool newState, String title) =>
      state = state.copyWith(isEnglish: newState, currentLanguageTitle: title);

  updateDistanceFormat(bool newState, int newInitialIndex) => state =
      state.copyWith(isKm: newState, distanceInitialIndex: newInitialIndex);

  updateTemperatureFormat(bool newState, int newInitialIndex) => state = state
      .copyWith(isCelsius: newState, temperatureInitialIndex: newInitialIndex);

  updateTimeFormat(bool newState, int newInitialIndex) =>
      state = state.copyWith(
          isTimeFormat24: newState, timeFormatInitialIndex: newInitialIndex);
}

final applicationSettingsStateProvider = StateNotifierProvider<
    ApplicationSettingsStateNotifier,
    ApplicationSettingsState>((_) => ApplicationSettingsStateNotifier());
