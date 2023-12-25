import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui/viewmodels/auth/signup-screen-viewmodel.dart';
import '../../ui/views/auth/screens/login-screen.dart';
import '../../ui/views/auth/screens/signup-with-email-screen.dart';
import 'social-login-mixin.dart';
import 'terms-accepted-mixin.dart';

class SignupScreenPresenter extends StateNotifier<SignupScreenViewModel>
    with SocialLogin, TermsAccepted {
  SignupScreenPresenter({required BuildContext newContext, required Ref newRef})
      : super(SignupScreenViewModel()) {
    buildContext = newContext;
    ref = newRef;
    state = SignupScreenViewModel(termsAccepted: termsAccepted);
  }

  doEmailSignup() {
    Navigator.pushReplacement(buildContext,
        MaterialPageRoute(builder: (context) => SignupWithEmailScreen()));
  }

  doLogin() {
    Navigator.pushReplacement(
        buildContext, MaterialPageRoute(builder: (context) => LogInScreen()));
  }
}

final signupScreenMVPProvider = StateNotifierProvider.family<
    SignupScreenPresenter, SignupScreenViewModel, BuildContext>((ref, context) {
  return SignupScreenPresenter(newContext: context, newRef: ref);
});
