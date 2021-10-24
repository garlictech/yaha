import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/auth/cognito/auth-methods.dart';

import 'oauth2-state.dart';

class AuthState {
  final AuthMethod? ongoingAuthMethod;
  final String? error;
  final bool working;
  final bool loggedIn;

  AuthState(
      {this.ongoingAuthMethod,
      this.error,
      this.working = false,
      this.loggedIn = false});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(bool loggedIn) : super(AuthState(loggedIn: loggedIn));

  loginWith(AuthMethod method) =>
      state = AuthState(ongoingAuthMethod: method, working: true);

  cancelLogin() => state = AuthState();

  errorHappened(String error) =>
      state = AuthState(working: false, error: error);

  loggedIn() => state = AuthState(loggedIn: true);

  logout() => state = AuthState(loggedIn: false, error: null);
}

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final oAuth2State = ref.watch(oAuth2StateProvider);
  return AuthStateNotifier(oAuth2State.loggedIn);
});
