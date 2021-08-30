// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $UserState {
  const $UserState();

  double get averageHikingSpeed;

  UserState copyWith({
    double? averageHikingSpeed,
  }) =>
      UserState(
        averageHikingSpeed: averageHikingSpeed ?? this.averageHikingSpeed,
      );

  UserState copyUsing(void Function(UserState$Change change) mutator) {
    final change = UserState$Change._(
      this.averageHikingSpeed,
    );
    mutator(change);
    return UserState(
      averageHikingSpeed: change.averageHikingSpeed,
    );
  }

  @override
  String toString() => "UserState(averageHikingSpeed: $averageHikingSpeed)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is UserState &&
      other.runtimeType == runtimeType &&
      averageHikingSpeed == other.averageHikingSpeed;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return averageHikingSpeed.hashCode;
  }
}

class UserState$Change {
  UserState$Change._(
    this.averageHikingSpeed,
  );

  double averageHikingSpeed;
}

// ignore: avoid_classes_with_only_static_members
class UserState$ {
  static final averageHikingSpeed = Lens<UserState, double>(
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

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return UserState(
    averageHikingSpeed: (json['averageHikingSpeed'] as num).toDouble(),
  );
}

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'averageHikingSpeed': instance.averageHikingSpeed,
    };
