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
  int get ususalStartTime;
  String get startTime;
  String get currentLanguageTitle;
  double get averageHikingSpeed;

  ApplicationSettingsState copyWith({
    bool? isEnglish,
    bool? isKm,
    bool? isCelsius,
    bool? isTimeFormat24,
    int? distanceInitialIndex,
    int? temperatureInitialIndex,
    int? timeFormatInitialIndex,
    int? ususalStartTime,
    String? startTime,
    String? currentLanguageTitle,
    double? averageHikingSpeed,
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
        ususalStartTime: ususalStartTime ?? this.ususalStartTime,
        startTime: startTime ?? this.startTime,
        currentLanguageTitle: currentLanguageTitle ?? this.currentLanguageTitle,
        averageHikingSpeed: averageHikingSpeed ?? this.averageHikingSpeed,
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
      this.ususalStartTime,
      this.startTime,
      this.currentLanguageTitle,
      this.averageHikingSpeed,
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
      ususalStartTime: change.ususalStartTime,
      startTime: change.startTime,
      currentLanguageTitle: change.currentLanguageTitle,
      averageHikingSpeed: change.averageHikingSpeed,
    );
  }

  @override
  String toString() =>
      "ApplicationSettingsState(isEnglish: $isEnglish, isKm: $isKm, isCelsius: $isCelsius, isTimeFormat24: $isTimeFormat24, distanceInitialIndex: $distanceInitialIndex, temperatureInitialIndex: $temperatureInitialIndex, timeFormatInitialIndex: $timeFormatInitialIndex, ususalStartTime: $ususalStartTime, startTime: $startTime, currentLanguageTitle: $currentLanguageTitle, averageHikingSpeed: $averageHikingSpeed)";

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
      ususalStartTime == other.ususalStartTime &&
      startTime == other.startTime &&
      currentLanguageTitle == other.currentLanguageTitle &&
      averageHikingSpeed == other.averageHikingSpeed;

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
    result = 37 * result + ususalStartTime.hashCode;
    result = 37 * result + startTime.hashCode;
    result = 37 * result + currentLanguageTitle.hashCode;
    result = 37 * result + averageHikingSpeed.hashCode;
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
    this.ususalStartTime,
    this.startTime,
    this.currentLanguageTitle,
    this.averageHikingSpeed,
  );

  bool isEnglish;
  bool isKm;
  bool isCelsius;
  bool isTimeFormat24;
  int distanceInitialIndex;
  int temperatureInitialIndex;
  int timeFormatInitialIndex;
  int ususalStartTime;
  String startTime;
  String currentLanguageTitle;
  double averageHikingSpeed;
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

  static final ususalStartTime = Lens<ApplicationSettingsState, int>(
    (ususalStartTimeContainer) => ususalStartTimeContainer.ususalStartTime,
    (ususalStartTimeContainer, ususalStartTime) =>
        ususalStartTimeContainer.copyWith(ususalStartTime: ususalStartTime),
  );

  static final startTime = Lens<ApplicationSettingsState, String>(
    (startTimeContainer) => startTimeContainer.startTime,
    (startTimeContainer, startTime) =>
        startTimeContainer.copyWith(startTime: startTime),
  );

  static final currentLanguageTitle = Lens<ApplicationSettingsState, String>(
    (currentLanguageTitleContainer) =>
        currentLanguageTitleContainer.currentLanguageTitle,
    (currentLanguageTitleContainer, currentLanguageTitle) =>
        currentLanguageTitleContainer.copyWith(
            currentLanguageTitle: currentLanguageTitle),
  );

  static final averageHikingSpeed = Lens<ApplicationSettingsState, double>(
    (averageHikingSpeedContainer) =>
        averageHikingSpeedContainer.averageHikingSpeed,
    (averageHikingSpeedContainer, averageHikingSpeed) =>
        averageHikingSpeedContainer.copyWith(
            averageHikingSpeed: averageHikingSpeed),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationSettingsState _$ApplicationSettingsStateFromJson(
    Map<String, dynamic> json) {
  return ApplicationSettingsState(
    isEnglish: json['isEnglish'] as bool,
    isKm: json['isKm'] as bool,
    isCelsius: json['isCelsius'] as bool,
    isTimeFormat24: json['isTimeFormat24'] as bool,
    distanceInitialIndex: json['distanceInitialIndex'] as int,
    temperatureInitialIndex: json['temperatureInitialIndex'] as int,
    averageHikingSpeed: (json['averageHikingSpeed'] as num).toDouble(),
    timeFormatInitialIndex: json['timeFormatInitialIndex'] as int,
    ususalStartTime: json['ususalStartTime'] as int,
    startTime: json['startTime'] as String,
    currentLanguageTitle: json['currentLanguageTitle'] as String,
  );
}

Map<String, dynamic> _$ApplicationSettingsStateToJson(
        ApplicationSettingsState instance) =>
    <String, dynamic>{
      'isEnglish': instance.isEnglish,
      'isKm': instance.isKm,
      'isCelsius': instance.isCelsius,
      'isTimeFormat24': instance.isTimeFormat24,
      'distanceInitialIndex': instance.distanceInitialIndex,
      'temperatureInitialIndex': instance.temperatureInitialIndex,
      'timeFormatInitialIndex': instance.timeFormatInitialIndex,
      'ususalStartTime': instance.ususalStartTime,
      'startTime': instance.startTime,
      'currentLanguageTitle': instance.currentLanguageTitle,
      'averageHikingSpeed': instance.averageHikingSpeed,
    };
