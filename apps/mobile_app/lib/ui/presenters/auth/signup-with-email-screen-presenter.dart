import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/auth/signup-with-email-screen-viewmodel.dart';
import '../../views/auth/screens/login-screen.dart';
import 'social-login-mixin.dart';
import 'terms-accepted-mixin.dart';

class SignupWithEmailPresenter extends StateNotifier<SignupWithEmailViewmodel>
    with TermsAccepted, SocialLogin {
  SignupWithEmailPresenter(
      {required BuildContext newContext, required Ref newRef})
      : super(SignupWithEmailViewmodel()) {
    ref = newRef;
    buildContext = newContext;
    state = SignupWithEmailViewmodel(termsAccepted: termsAccepted);
  }

  setPassword(String password) => state.copyWith(password: password);

  setPasswordAgain(String password) => state.copyWith(passwordAgain: password);

  doLogin() {
    Navigator.pushReplacement(buildContext,
        MaterialPageRoute(builder: (context) => const LogInScreen()));
  }
}

final signupWithEmailMVPProvider = StateNotifierProvider.family<
        SignupWithEmailPresenter, SignupWithEmailViewmodel, BuildContext>(
    (ref, context) =>
        SignupWithEmailPresenter(newContext: context, newRef: ref));
