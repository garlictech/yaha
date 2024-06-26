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
  DateTime? get startTime;
  DateTime? get finishTime;
  bool get startTimePickerVisibility;
  bool get finishTimePickerVisibility;
  String get currentLanguageTitle;
  String get averageHikingSpeed;

  ApplicationSettingsState copyWith({
    bool? isEnglish,
    bool? isKm,
    bool? isCelsius,
    bool? isTimeFormat24,
    int? distanceInitialIndex,
    int? temperatureInitialIndex,
    int? timeFormatInitialIndex,
    DateTime? startTime,
    DateTime? finishTime,
    bool? startTimePickerVisibility,
    bool? finishTimePickerVisibility,
    String? currentLanguageTitle,
    String? averageHikingSpeed,
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
        startTime: startTime ?? this.startTime,
        finishTime: finishTime ?? this.finishTime,
        startTimePickerVisibility:
            startTimePickerVisibility ?? this.startTimePickerVisibility,
        finishTimePickerVisibility:
            finishTimePickerVisibility ?? this.finishTimePickerVisibility,
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
      this.startTime,
      this.finishTime,
      this.startTimePickerVisibility,
      this.finishTimePickerVisibility,
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
      startTime: change.startTime,
      finishTime: change.finishTime,
      startTimePickerVisibility: change.startTimePickerVisibility,
      finishTimePickerVisibility: change.finishTimePickerVisibility,
      currentLanguageTitle: change.currentLanguageTitle,
      averageHikingSpeed: change.averageHikingSpeed,
    );
  }

  @override
  String toString() =>
      "ApplicationSettingsState(isEnglish: $isEnglish, isKm: $isKm, isCelsius: $isCelsius, isTimeFormat24: $isTimeFormat24, distanceInitialIndex: $distanceInitialIndex, temperatureInitialIndex: $temperatureInitialIndex, timeFormatInitialIndex: $timeFormatInitialIndex, startTime: $startTime, finishTime: $finishTime, startTimePickerVisibility: $startTimePickerVisibility, finishTimePickerVisibility: $finishTimePickerVisibility, currentLanguageTitle: $currentLanguageTitle, averageHikingSpeed: $averageHikingSpeed)";

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
      startTime == other.startTime &&
      finishTime == other.finishTime &&
      startTimePickerVisibility == other.startTimePickerVisibility &&
      finishTimePickerVisibility == other.finishTimePickerVisibility &&
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
    result = 37 * result + startTime.hashCode;
    result = 37 * result + finishTime.hashCode;
    result = 37 * result + startTimePickerVisibility.hashCode;
    result = 37 * result + finishTimePickerVisibility.hashCode;
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
    this.startTime,
    this.finishTime,
    this.startTimePickerVisibility,
    this.finishTimePickerVisibility,
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
  DateTime? startTime;
  DateTime? finishTime;
  bool startTimePickerVisibility;
  bool finishTimePickerVisibility;
  String currentLanguageTitle;
  String averageHikingSpeed;
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

  static final startTime = Lens<ApplicationSettingsState, DateTime?>(
    (startTimeContainer) => startTimeContainer.startTime,
    (startTimeContainer, startTime) =>
        startTimeContainer.copyWith(startTime: startTime),
  );

  static final finishTime = Lens<ApplicationSettingsState, DateTime?>(
    (finishTimeContainer) => finishTimeContainer.finishTime,
    (finishTimeContainer, finishTime) =>
        finishTimeContainer.copyWith(finishTime: finishTime),
  );

  static final startTimePickerVisibility = Lens<ApplicationSettingsState, bool>(
    (startTimePickerVisibilityContainer) =>
        startTimePickerVisibilityContainer.startTimePickerVisibility,
    (startTimePickerVisibilityContainer, startTimePickerVisibility) =>
        startTimePickerVisibilityContainer.copyWith(
            startTimePickerVisibility: startTimePickerVisibility),
  );

  static final finishTimePickerVisibility =
      Lens<ApplicationSettingsState, bool>(
    (finishTimePickerVisibilityContainer) =>
        finishTimePickerVisibilityContainer.finishTimePickerVisibility,
    (finishTimePickerVisibilityContainer, finishTimePickerVisibility) =>
        finishTimePickerVisibilityContainer.copyWith(
            finishTimePickerVisibility: finishTimePickerVisibility),
  );

  static final currentLanguageTitle = Lens<ApplicationSettingsState, String>(
    (currentLanguageTitleContainer) =>
        currentLanguageTitleContainer.currentLanguageTitle,
    (currentLanguageTitleContainer, currentLanguageTitle) =>
        currentLanguageTitleContainer.copyWith(
            currentLanguageTitle: currentLanguageTitle),
  );

  static final averageHikingSpeed = Lens<ApplicationSettingsState, String>(
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
        Map<String, dynamic> json) =>
    ApplicationSettingsState(
      isEnglish: json['isEnglish'] as bool? ?? true,
      isKm: json['isKm'] as bool? ?? true,
      isCelsius: json['isCelsius'] as bool? ?? true,
      isTimeFormat24: json['isTimeFormat24'] as bool? ?? true,
      distanceInitialIndex: json['distanceInitialIndex'] as int? ?? 0,
      temperatureInitialIndex: json['temperatureInitialIndex'] as int? ?? 0,
      averageHikingSpeed: json['averageHikingSpeed'] as String? ?? '4',
      timeFormatInitialIndex: json['timeFormatInitialIndex'] as int? ?? 1,
      startTime: json['startTime'],
      finishTime: json['finishTime'],
      startTimePickerVisibility:
          json['startTimePickerVisibility'] as bool? ?? false,
      finishTimePickerVisibility:
          json['finishTimePickerVisibility'] as bool? ?? false,
      currentLanguageTitle:
          json['currentLanguageTitle'] as String? ?? 'English',
    );

Map<String, dynamic> _$ApplicationSettingsStateToJson(
    ApplicationSettingsState instance) {
  final val = <String, dynamic>{
    'isEnglish': instance.isEnglish,
    'isKm': instance.isKm,
    'isCelsius': instance.isCelsius,
    'isTimeFormat24': instance.isTimeFormat24,
    'distanceInitialIndex': instance.distanceInitialIndex,
    'temperatureInitialIndex': instance.temperatureInitialIndex,
    'timeFormatInitialIndex': instance.timeFormatInitialIndex,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startTime', instance.startTime?.toIso8601String());
  writeNotNull('finishTime', instance.finishTime?.toIso8601String());
  val['startTimePickerVisibility'] = instance.startTimePickerVisibility;
  val['finishTimePickerVisibility'] = instance.finishTimePickerVisibility;
  val['currentLanguageTitle'] = instance.currentLanguageTitle;
  val['averageHikingSpeed'] = instance.averageHikingSpeed;
  return val;
}
