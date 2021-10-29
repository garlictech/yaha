import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/screens/signup-screen.dart';
import '../views/screens/login-with-email-screen.dart';
import '../viewmodels/login-screen-viewmodel.dart';
import 'social-login-mixin.dart';
import 'terms-accepted-mixin.dart';

class LoginScreenPresenter extends StateNotifier<LoginScreenViewModel>
    with SocialLogin, TermsAccepted {
  LoginScreenPresenter(
      {required BuildContext newContext, required ProviderReference newRef})
      : super(LoginScreenViewModel()) {
    ref = newRef;
    buildContext = newContext;
    state = LoginScreenViewModel(termsAccepted: termsAccepted);
  }

  doEmailLogin() {
    Navigator.pushReplacement(buildContext,
        MaterialPageRoute(builder: (context) => LogInWithEmailScreen()));
  }

  doSignup() {
    Navigator.pushReplacement(
        buildContext, MaterialPageRoute(builder: (context) => SignupScreen()));
  }
}

final loginScreenMVPProvider = StateNotifierProvider.family<
    LoginScreenPresenter, LoginScreenViewModel, BuildContext>((ref, context) {
  return LoginScreenPresenter(newContext: context, newRef: ref);
});
