import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupState {
  final String password;
  final String passwordAgain;
  final bool passwordMismatch;

  SignupState({
    this.password = '',
    this.passwordAgain = '',
    this.passwordMismatch = false,
  });
}

final signupStateProvider = StateProvider<SignupState>((ref) {
  return SignupState();
});
