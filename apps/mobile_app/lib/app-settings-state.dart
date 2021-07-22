import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationSettingsState {
  // bool isEnglish;
  // bool isKm;
  // bool isCelsius;
  // bool isTimeFormat12;

  // ApplicationSettingsState(
  //     {this.isEnglish = true,
  //     this.isKm = true,
  //     this.isCelsius = true,
  //     this.isTimeFormat12 = false});
}

class ApplicationSettingsStateNotifier
    extends StateNotifier<ApplicationSettingsState> {
  static bool isEnglish = true;
  static bool isKm = true;
  static bool isCelsius = true;
  static bool isTimeFormat24 = true;
  static int distanceInitialIndex = 0;
  static int temperatureInitialIndex = 0;
  static int timeFormatInitialIndex = 1;
  static String currentLanguageTitle = 'English';

  ApplicationSettingsStateNotifier() : super(ApplicationSettingsState());

  updateApplicationSettings(ApplicationSettingsState newState) =>
      state = newState;

  updateLanguage(bool newLangState, String title) => {
        ApplicationSettingsStateNotifier.isEnglish = newLangState,
        ApplicationSettingsStateNotifier.currentLanguageTitle = title,
      };

  updateDistanceFormat(bool newState, int newInitialIndex) => {
        ApplicationSettingsStateNotifier.isKm = newState,
        ApplicationSettingsStateNotifier.distanceInitialIndex = newInitialIndex
      };

  updateTemperatureFormat(bool newState, int newInitialIndex) => {
        ApplicationSettingsStateNotifier.isCelsius = newState,
        ApplicationSettingsStateNotifier.temperatureInitialIndex =
            newInitialIndex
      };

  updateTimeFormat(bool newState, int newInitialIndex) => {
        ApplicationSettingsStateNotifier.isTimeFormat24 = newState,
        ApplicationSettingsStateNotifier.temperatureInitialIndex =
            newInitialIndex
      };
}

final applicationSettingsStateProvider = StateNotifierProvider<
    ApplicationSettingsStateNotifier,
    ApplicationSettingsState>((_) => ApplicationSettingsStateNotifier());
