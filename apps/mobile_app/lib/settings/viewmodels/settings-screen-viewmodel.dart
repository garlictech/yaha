import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/auth/domain/auth-state.dart';
import 'package:yaha/auth/login-screen.dart';

class SettingsScreenViewModel {
  final bool loggedIn;

  SettingsScreenViewModel({this.loggedIn = false});
}

class SettingsScreenPresenter extends StateNotifier<SettingsScreenViewModel> {
  SettingsScreenPresenter(bool loggedIn)
      : super(SettingsScreenViewModel(loggedIn: loggedIn));

  doLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LogInScreen()));
  }
}

final settingsScreenViewModelProvider =
    StateNotifierProvider<SettingsScreenPresenter, SettingsScreenViewModel>(
        (ref) {
  final authState = ref.watch(authStateProvider);
  return SettingsScreenPresenter(authState.loggedIn);
});
