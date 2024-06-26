import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/auth/login-with-email-screen-viewmodel.dart';
import '../../views/auth/screens/signup-screen.dart';
import 'social-login-mixin.dart';
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
    Navigator.pushReplacement(buildContext,
        MaterialPageRoute(builder: (context) => const SignupScreen()));
  }
}

final loginWithEmailMVPProvider = StateNotifierProvider.family<
        LoginWithEmailPresenter, LoginWithEmailViewmodel, BuildContext>(
    (ref, context) =>
        LoginWithEmailPresenter(newContext: context, newRef: ref));
