import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/config/ps_theme_data.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/db/common/ps_shared_preferences.dart';
import 'package:fluttermultirestaurant/repository/Common/ps_repository.dart';

class PsThemeRepository extends PsRepository {
  PsThemeRepository({required PsSharedPreferences psSharedPreferences}) {
    _psSharedPreferences = psSharedPreferences;
  }

 late PsSharedPreferences _psSharedPreferences;

  Future<void> updateTheme(bool isDarkTheme) async {
    await _psSharedPreferences.shared
        .setBool(PsConst.THEME__IS_DARK_THEME, isDarkTheme);
  }

  ThemeData getTheme() {
    final bool isDarkTheme =
        _psSharedPreferences.shared.getBool(PsConst.THEME__IS_DARK_THEME) ??
            false;

    if (isDarkTheme) {
      return themeData(ThemeData.dark());
    } else {
      return themeData(ThemeData.light());
    }
  }
}
