import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupState {
  String password;
  String passwordAgain;

  SignupState({
    this.password = '',
    this.passwordAgain = '',
  });
}

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier() : super(SignupState());

  setPassword(String password) => state =
      SignupState(password: password, passwordAgain: state.passwordAgain);

  setPasswordAgain(String password) =>
      state = SignupState(password: state.password, passwordAgain: password);
}

final signupStateProvider =
    StateNotifierProvider<SignupStateNotifier, SignupState>(
        (_) => SignupStateNotifier());
