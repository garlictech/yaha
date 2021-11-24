import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/states/auth/auth-state.dart';
import 'package:yaha/use-cases/auth/auth-use-cases-provider.dart';
import 'package:yaha/use-cases/auth/auth-use-cases.dart';
import 'package:yaha/views/auth/screens/login-screen.dart';
import '../viewmodels/settings-screen-viewmodel.dart';

class SettingsScreenPresenter extends StateNotifier<SettingsScreenViewModel> {
  final AuthUseCases authUseCases;

  SettingsScreenPresenter(bool loggedIn, {required this.authUseCases})
      : super(SettingsScreenViewModel(loggedIn: loggedIn));

  doLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LogInScreen()));
  }

  doLogout() => authUseCases.logout();
}

final settingsScreenMVPProvider =
    StateNotifierProvider<SettingsScreenPresenter, SettingsScreenViewModel>(
        (ref) {
  final authState = ref.watch(authStateProvider);
  final authUseCases = ref.watch(authUseCasesProvider);
  return SettingsScreenPresenter(authState.loggedIn,
      authUseCases: authUseCases);
});
