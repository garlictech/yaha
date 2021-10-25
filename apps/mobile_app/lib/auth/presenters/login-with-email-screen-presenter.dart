import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'social-login-mixin.dart';
import '../views/screens/signup-screen.dart';
import '../viewmodels/login-with-email-screen-viewmodel.dart';
import 'terms-accepted-mixin.dart';

class LoginWithEmailPresenter extends StateNotifier<LoginWithEmailViewmodel>
    with TermsAccepted, SocialLogin {
  LoginWithEmailPresenter(
      {required BuildContext newContext, required ProviderReference newRef})
      : super(LoginWithEmailViewmodel()) {
    ref = newRef;
    buildContext = newContext;
    state = LoginWithEmailViewmodel(termsAccepted: termsAccepted);
  }

  doSignup() {
    Navigator.pushReplacement(
        buildContext, MaterialPageRoute(builder: (context) => SignupScreen()));
  }
}

final loginWithEmailMVPProvider = StateNotifierProvider.family<
        LoginWithEmailPresenter, LoginWithEmailViewmodel, BuildContext>(
    (ref, context) =>
        LoginWithEmailPresenter(newContext: context, newRef: ref));
