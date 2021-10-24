import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/core/local-storage-handler.dart';

import 'oauth2-entity.dart';

part 'oauth2-state.g.dart';

@JsonSerializable()
class OAuth2State {
  final OAuth2Entity? tokens;
  final bool _loggedIn;

  OAuth2State({this.tokens}) : _loggedIn = tokens != null {
    print("STATE: $_loggedIn");
    print("token: ${tokens?.idToken}");
  }

  get loggedIn => _loggedIn;

  factory OAuth2State.fromJson(Map<String, dynamic> json) =>
      _$OAuth2StateFromJson(json);

  Map<String, dynamic> toJson() => _$OAuth2StateToJson(this);
}

class OAuth2StateNotifier extends StateNotifier<OAuth2State> {
  static const localStorageKey = 'oauth2tokens';

  final LocalStorageHandler _localStorageHandler;

  OAuth2StateNotifier(ProviderReference ref)
      : _localStorageHandler = ref.read(localStorageHandlerProvider),
        super(OAuth2State()) {
    _readSettingsFromLocalStore();
  }

  setTokens(OAuth2Entity? tokens) {
    _updateState(OAuth2State(tokens: tokens));
  }

  Future<void> _readSettingsFromLocalStore() async {
    (await _localStorageHandler.getItem(localStorageKey))
        .flatMap((x) => catching(() => OAuth2State.fromJson(x)))
        .fold((_) => NoValueInLocalStorageGlitch(localStorageKey),
            (r) => state = r);
  }

  _updateState(newState) async {
    state = newState;
    await _localStorageHandler.setItem(localStorageKey, state);
  }
}

final oAuth2StateProvider =
    StateNotifierProvider<OAuth2StateNotifier, OAuth2State>(
        (ref) => OAuth2StateNotifier(ref));
