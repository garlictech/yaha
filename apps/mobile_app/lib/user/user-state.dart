import 'package:dartz/dartz.dart' hide Lens;
import 'package:json_annotation/json_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/core/local-storage-handler.dart';

part 'user-state.g.dart';

@FunctionalData()
@JsonSerializable()
class UserState extends $UserState {
  final double averageHikingSpeed;

  UserState({this.averageHikingSpeed = 4.0});

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateToJson(this);
}

class UserStateNotifier extends StateNotifier<UserState> {
  static const localStorageKey = 'user';

  final LocalStorageHandler localStorageHandler;

  UserStateNotifier(ProviderReference ref)
      : localStorageHandler = ref.read(localStorageHandlerProvider),
        super(UserState()) {
    readSettingsFromLocalStore();
  }

  updateAverageHikingSpeed(double newSpeed) =>
      _updateState(state.copyWith(averageHikingSpeed: newSpeed));

  Future<void> readSettingsFromLocalStore() async {
    (await localStorageHandler.getItem(localStorageKey))
        .flatMap((x) => catching(() => UserState.fromJson(x)))
        .fold((_) => NoValueInLocalStorageGlitch(localStorageKey),
            (r) => state = r);
  }

  _updateState(newState) async {
    state = newState;
    await localStorageHandler.setItem(localStorageKey, state);
  }
}

final applicationSettingsStateProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
        (ref) => UserStateNotifier(ref));
