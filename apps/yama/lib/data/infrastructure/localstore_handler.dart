import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreHandler {
  Future<String?> getItem<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future setItem(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }

  Future removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
