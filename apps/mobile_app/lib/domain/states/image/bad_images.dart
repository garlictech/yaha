import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "bad_images.g.dart";

@riverpod
class BadImages extends _$BadImages {
  @override
  Set<String> build() {
    return {};
  }

  addBadImage(String url) {
    if (!state.contains(url)) {
      final newState = Set<String>.from(state);
      newState.add(url);
      state = newState;
      debugPrint("**** BAD IMAGE ADDED $url");
    }
  }
}
