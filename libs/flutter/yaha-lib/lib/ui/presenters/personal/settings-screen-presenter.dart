import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/personal/settings-screen-viewmodel.dart';

class SettingsScreenPresenter extends StateNotifier<SettingsScreenViewModel> {
  SettingsScreenPresenter(bool loggedIn)
      : super(SettingsScreenViewModel(loggedIn: loggedIn));

  doLogout() => {};
}

final settingsScreenMVPProvider =
    StateNotifierProvider<SettingsScreenPresenter, SettingsScreenViewModel>(
        (ref) {
  return SettingsScreenPresenter(true);
});
