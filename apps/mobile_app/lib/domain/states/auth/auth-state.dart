import 'package:functional_data/functional_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

part 'auth-state.g.dart';

@FunctionalData()
class AuthState extends $AuthState {
  @override
  final String? error;
  @override
  final bool working;
  @override
  final bool loggedIn;
  @override
  final bool termsAccepted;

  AuthState(
      {this.error,
      this.working = false,
      this.loggedIn = false,
      this.termsAccepted = false});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(bool loggedIn) : super(AuthState(loggedIn: loggedIn));

  loginWith(AuthMethod method) => state = AuthState(working: true);

  cancelLogin() => state = AuthState();

  errorHappened(String error) =>
      state = AuthState(working: false, error: error);

  loggedIn() => state = AuthState(loggedIn: true, termsAccepted: true);

  logout() => state = AuthState(loggedIn: false, error: null);

  setTermsAccepted(bool accepted) => state.copyWith(termsAccepted: accepted);
}
