import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/auth-methods.dart';
import '../views/social-login-screen.dart';
import '../viewmodels/login-screen-viewmodel.dart';

class LoginScreenPresenter extends StateNotifier<LoginScreenViewModel> {
  LoginScreenPresenter() : super(LoginScreenViewModel());

  doFacebookLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SocialLoginScreen(method: AuthMethod.FACEBOOK)));
  }

  doGoogleLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SocialLoginScreen(method: AuthMethod.GOOGLE)));
  }

  doAppleLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SocialLoginScreen(method: AuthMethod.APPLE)));
  }
}

final loginScreenMVPProvider =
    StateNotifierProvider<LoginScreenPresenter, LoginScreenViewModel>((ref) {
  return LoginScreenPresenter();
});
