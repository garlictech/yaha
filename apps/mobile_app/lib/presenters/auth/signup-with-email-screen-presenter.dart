import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/presenters/auth/social-login-mixin.dart';
import 'package:yaha/viewmodels/auth/signup-with-email-screen-viewmodel.dart';
import 'package:yaha/views/auth/screens/login-screen.dart';
import 'terms-accepted-mixin.dart';

class SignupWithEmailPresenter extends StateNotifier<SignupWithEmailViewmodel>
    with TermsAccepted, SocialLogin {
  SignupWithEmailPresenter(
      {required BuildContext newContext, required ProviderReference newRef})
      : super(SignupWithEmailViewmodel()) {
    ref = newRef;
    buildContext = newContext;
    state = SignupWithEmailViewmodel(termsAccepted: termsAccepted);
  }

  setPassword(String password) => state.copyWith(password: password);

  setPasswordAgain(String password) => state.copyWith(passwordAgain: password);

  doLogin() {
    Navigator.pushReplacement(
        buildContext, MaterialPageRoute(builder: (context) => LogInScreen()));
  }
}

final signupWithEmailMVPProvider = StateNotifierProvider.family<
        SignupWithEmailPresenter, SignupWithEmailViewmodel, BuildContext>(
    (ref, context) =>
        SignupWithEmailPresenter(newContext: context, newRef: ref));
