import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/viewmodels/auth/login-screen-viewmodel.dart';
import 'package:yaha/views/auth/screens/login-with-email-screen.dart';
import 'package:yaha/views/auth/screens/signup-screen.dart';

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
