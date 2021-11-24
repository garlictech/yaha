import 'package:functional_data/functional_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

import 'oauth2-state.dart';

part 'auth-state.g.dart';

@FunctionalData()
class AuthState extends $AuthState {
  final AuthMethod? ongoingAuthMethod;
  final String? error;
  final bool working;
  final bool loggedIn;
  final bool termsAccepted;

  AuthState(
      {this.ongoingAuthMethod,
      this.error,
      this.working = false,
      this.loggedIn = false,
      this.termsAccepted = false});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(bool loggedIn) : super(AuthState(loggedIn: loggedIn));

  loginWith(AuthMethod method) =>
      state = AuthState(ongoingAuthMethod: method, working: true);

  cancelLogin() => state = AuthState();

  errorHappened(String error) =>
      state = AuthState(working: false, error: error);

  loggedIn() => state = AuthState(loggedIn: true, termsAccepted: true);

  logout() => state = AuthState(loggedIn: false, error: null);

  setTermsAccepted(bool accepted) => state.copyWith(termsAccepted: accepted);
}

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final oAuth2State = ref.watch(oAuth2StateProvider);
  return AuthStateNotifier(oAuth2State.loggedIn);
});
