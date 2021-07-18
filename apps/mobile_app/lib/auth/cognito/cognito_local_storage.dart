import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Extend CognitoStorage with Shared Preferences to persist account
/// login sessions
class CognitoLocalStorage extends CognitoStorage {
  late SharedPreferences _prefs;
  CognitoLocalStorage();

  Future<SharedPreferences> get pref async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  @override
  Future getItem(String key) async {
    String? item;
    try {
      final prefs = await pref;
      final value = prefs.getString(key);

      if (value != null) {
        item = json.decode(value);
      }
    } catch (e) {
      return null;
    }
    return item;
  }

  @override
  Future setItem(String key, value) async {
    await (await pref).setString(key, json.encode(value));
    return getItem(key);
  }

  @override
  Future removeItem(String key) async {
    final item = getItem(key);
    await (await pref).remove(key);
    return item;
  }

  @override
  Future<void> clear() async {
    await (await pref).clear();
  }
}
