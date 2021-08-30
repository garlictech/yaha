import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';

import 'glitch.dart';

class NoValueInLocalStorageGlitch extends Glitch {
  NoValueInLocalStorageGlitch(String key)
      : super(message: "No value in lical store with key $key");
}

class LocalStorageHandler {
  Future<Either<dynamic, dynamic>> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);

    return Future.value((value == null
            ? left<dynamic, dynamic>(NoValueInLocalStorageGlitch())
            : right<dynamic, dynamic>(value))
        .flatMap((x) => catching<dynamic>(() => json.decode(x))
            .leftMap((x) => NoValueInLocalStorageGlitch())));
  }

  Future setItem(String key, value) async {
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

final localStorageHandlerProvider =
    Provider<LocalStorageHandler>((ref) => LocalStorageHandler());
