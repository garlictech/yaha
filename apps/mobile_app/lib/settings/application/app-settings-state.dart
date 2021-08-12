import 'package:dartz/dartz.dart' hide Lens;
import 'package:json_annotation/json_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/core/local-storage-handler.dart';

part 'app-settings-state.g.dart';

@FunctionalData()
@JsonSerializable()
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

  factory ApplicationSettingsState.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationSettingsStateToJson(this);
}

class ApplicationSettingsStateNotifier
    extends StateNotifier<ApplicationSettingsState> {
  static const localStorageKey = 'applicationSettings';

  final LocalStorageHandler localStorageHandler;

  ApplicationSettingsStateNotifier(ProviderReference ref)
      : localStorageHandler = ref.read(localStorageHandlerProvider),
        super(ApplicationSettingsState()) {
    readSettingsFromLocalStore();
  }

  updateLanguage(bool newState, String title) => _updateState(
      state.copyWith(isEnglish: newState, currentLanguageTitle: title));

  updateDistanceFormat(bool newState, int newInitialIndex) => _updateState(
      state.copyWith(isKm: newState, distanceInitialIndex: newInitialIndex));

  updateTemperatureFormat(bool newState, int newInitialIndex) =>
      _updateState(state.copyWith(
          isCelsius: newState, temperatureInitialIndex: newInitialIndex));

  updateTimeFormat(bool newState, int newInitialIndex) =>
      _updateState(state.copyWith(
          isTimeFormat24: newState, timeFormatInitialIndex: newInitialIndex));

  Future<void> readSettingsFromLocalStore() async {
    (await localStorageHandler.getItem(localStorageKey))
        .flatMap((x) => catching(() => ApplicationSettingsState.fromJson(x)))
        .fold((_) => NoValueInLocalStorageGlitch(), (r) => state = r);
  }

  _updateState(newState) async {
    state = newState;
    await localStorageHandler.setItem(localStorageKey, state);
  }
}

final applicationSettingsStateProvider = StateNotifierProvider<
    ApplicationSettingsStateNotifier,
    ApplicationSettingsState>((ref) => ApplicationSettingsStateNotifier(ref));
