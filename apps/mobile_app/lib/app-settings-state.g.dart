// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app-settings-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $ApplicationSettingsState {
  const $ApplicationSettingsState();

  bool get isEnglish;
  bool get isKm;
  bool get isCelsius;
  bool get isTimeFormat24;
  int get distanceInitialIndex;
  int get temperatureInitialIndex;
  int get timeFormatInitialIndex;
  String get currentLanguageTitle;

  ApplicationSettingsState copyWith({
    bool? isEnglish,
    bool? isKm,
    bool? isCelsius,
    bool? isTimeFormat24,
    int? distanceInitialIndex,
    int? temperatureInitialIndex,
    int? timeFormatInitialIndex,
    String? currentLanguageTitle,
  }) =>
      ApplicationSettingsState(
        isEnglish: isEnglish ?? this.isEnglish,
        isKm: isKm ?? this.isKm,
        isCelsius: isCelsius ?? this.isCelsius,
        isTimeFormat24: isTimeFormat24 ?? this.isTimeFormat24,
        distanceInitialIndex: distanceInitialIndex ?? this.distanceInitialIndex,
        temperatureInitialIndex:
            temperatureInitialIndex ?? this.temperatureInitialIndex,
        timeFormatInitialIndex:
            timeFormatInitialIndex ?? this.timeFormatInitialIndex,
        currentLanguageTitle: currentLanguageTitle ?? this.currentLanguageTitle,
      );

  ApplicationSettingsState copyUsing(
      void Function(ApplicationSettingsState$Change change) mutator) {
    final change = ApplicationSettingsState$Change._(
      this.isEnglish,
      this.isKm,
      this.isCelsius,
      this.isTimeFormat24,
      this.distanceInitialIndex,
      this.temperatureInitialIndex,
      this.timeFormatInitialIndex,
      this.currentLanguageTitle,
    );
    mutator(change);
    return ApplicationSettingsState(
      isEnglish: change.isEnglish,
      isKm: change.isKm,
      isCelsius: change.isCelsius,
      isTimeFormat24: change.isTimeFormat24,
      distanceInitialIndex: change.distanceInitialIndex,
      temperatureInitialIndex: change.temperatureInitialIndex,
      timeFormatInitialIndex: change.timeFormatInitialIndex,
      currentLanguageTitle: change.currentLanguageTitle,
    );
  }

  @override
  String toString() =>
      "ApplicationSettingsState(isEnglish: $isEnglish, isKm: $isKm, isCelsius: $isCelsius, isTimeFormat24: $isTimeFormat24, distanceInitialIndex: $distanceInitialIndex, temperatureInitialIndex: $temperatureInitialIndex, timeFormatInitialIndex: $timeFormatInitialIndex, currentLanguageTitle: $currentLanguageTitle)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ApplicationSettingsState &&
      other.runtimeType == runtimeType &&
      isEnglish == other.isEnglish &&
      isKm == other.isKm &&
      isCelsius == other.isCelsius &&
      isTimeFormat24 == other.isTimeFormat24 &&
      distanceInitialIndex == other.distanceInitialIndex &&
      temperatureInitialIndex == other.temperatureInitialIndex &&
      timeFormatInitialIndex == other.timeFormatInitialIndex &&
      currentLanguageTitle == other.currentLanguageTitle;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + isEnglish.hashCode;
    result = 37 * result + isKm.hashCode;
    result = 37 * result + isCelsius.hashCode;
    result = 37 * result + isTimeFormat24.hashCode;
    result = 37 * result + distanceInitialIndex.hashCode;
    result = 37 * result + temperatureInitialIndex.hashCode;
    result = 37 * result + timeFormatInitialIndex.hashCode;
    result = 37 * result + currentLanguageTitle.hashCode;
    return result;
  }
}

class ApplicationSettingsState$Change {
  ApplicationSettingsState$Change._(
    this.isEnglish,
    this.isKm,
    this.isCelsius,
    this.isTimeFormat24,
    this.distanceInitialIndex,
    this.temperatureInitialIndex,
    this.timeFormatInitialIndex,
    this.currentLanguageTitle,
  );

  bool isEnglish;
  bool isKm;
  bool isCelsius;
  bool isTimeFormat24;
  int distanceInitialIndex;
  int temperatureInitialIndex;
  int timeFormatInitialIndex;
  String currentLanguageTitle;
}

// ignore: avoid_classes_with_only_static_members
class ApplicationSettingsState$ {
  static final isEnglish = Lens<ApplicationSettingsState, bool>(
    (isEnglishContainer) => isEnglishContainer.isEnglish,
    (isEnglishContainer, isEnglish) =>
        isEnglishContainer.copyWith(isEnglish: isEnglish),
  );

  static final isKm = Lens<ApplicationSettingsState, bool>(
    (isKmContainer) => isKmContainer.isKm,
    (isKmContainer, isKm) => isKmContainer.copyWith(isKm: isKm),
  );

  static final isCelsius = Lens<ApplicationSettingsState, bool>(
    (isCelsiusContainer) => isCelsiusContainer.isCelsius,
    (isCelsiusContainer, isCelsius) =>
        isCelsiusContainer.copyWith(isCelsius: isCelsius),
  );

  static final isTimeFormat24 = Lens<ApplicationSettingsState, bool>(
    (isTimeFormat24Container) => isTimeFormat24Container.isTimeFormat24,
    (isTimeFormat24Container, isTimeFormat24) =>
        isTimeFormat24Container.copyWith(isTimeFormat24: isTimeFormat24),
  );

  static final distanceInitialIndex = Lens<ApplicationSettingsState, int>(
    (distanceInitialIndexContainer) =>
        distanceInitialIndexContainer.distanceInitialIndex,
    (distanceInitialIndexContainer, distanceInitialIndex) =>
        distanceInitialIndexContainer.copyWith(
            distanceInitialIndex: distanceInitialIndex),
  );

  static final temperatureInitialIndex = Lens<ApplicationSettingsState, int>(
    (temperatureInitialIndexContainer) =>
        temperatureInitialIndexContainer.temperatureInitialIndex,
    (temperatureInitialIndexContainer, temperatureInitialIndex) =>
        temperatureInitialIndexContainer.copyWith(
            temperatureInitialIndex: temperatureInitialIndex),
  );

  static final timeFormatInitialIndex = Lens<ApplicationSettingsState, int>(
    (timeFormatInitialIndexContainer) =>
        timeFormatInitialIndexContainer.timeFormatInitialIndex,
    (timeFormatInitialIndexContainer, timeFormatInitialIndex) =>
        timeFormatInitialIndexContainer.copyWith(
            timeFormatInitialIndex: timeFormatInitialIndex),
  );

  static final currentLanguageTitle = Lens<ApplicationSettingsState, String>(
    (currentLanguageTitleContainer) =>
        currentLanguageTitleContainer.currentLanguageTitle,
    (currentLanguageTitleContainer, currentLanguageTitle) =>
        currentLanguageTitleContainer.copyWith(
            currentLanguageTitle: currentLanguageTitle),
  );
}
