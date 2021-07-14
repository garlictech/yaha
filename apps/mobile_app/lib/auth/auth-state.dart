import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cognito/login_methods.dart';

class AuthState {
  final LoginMethod? loginMethod;
  final String? error;
  final bool working;

  AuthState({this.loginMethod, this.error, this.working = false});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState());

  startSocialLogin(LoginMethod method) =>
      state = AuthState(loginMethod: method, working: true);

  finishSocialLogin() => state = AuthState();

  errorHappened(String error) =>
      state = AuthState(working: false, error: error);

  clearError() => state = AuthState(loginMethod: state.loginMethod);

  loggedIn() => state = AuthState();

  waiting() =>
      state = AuthState(loginMethod: state.loginMethod, error: state.error);
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
