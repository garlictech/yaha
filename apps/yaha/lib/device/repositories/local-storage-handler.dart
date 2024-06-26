import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';
import 'package:yaha/utils/failure.dart';

class NoValueInLocalStorageGlitch extends Failure {
  const NoValueInLocalStorageGlitch(String key)
      : super("No value in local store with key $key");
}

class LocalStorageHandler {
  Future<Either<dynamic, dynamic>> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);

    return Future.value((value == null
            ? left<dynamic, dynamic>(NoValueInLocalStorageGlitch(key))
            : right<dynamic, dynamic>(value))
        .flatMap((x) => catching<dynamic>(() => json.decode(x))
            .leftMap((x) => NoValueInLocalStorageGlitch(key))));
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
