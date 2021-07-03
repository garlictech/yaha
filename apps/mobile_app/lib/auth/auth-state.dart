import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cognito/login_methods.dart';

class AuthState {
  final LoginMethod? socialLoginStarted;
  final String? error;

  AuthState({this.socialLoginStarted, this.error});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState());

  startSocialLogin(LoginMethod method) =>
      state = AuthState(socialLoginStarted: method);

  errorHappened(String error) =>
      state = AuthState(socialLoginStarted: null, error: error);

  clearError() => state =
      AuthState(socialLoginStarted: state.socialLoginStarted, error: null);
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
