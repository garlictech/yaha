import 'package:riverpod_annotation/riverpod_annotation.dart';

part "bad_images_service.g.dart";

@riverpod
class BadImagesService extends _$BadImagesService {
  @override
  Set<String> build() {
    return {};
  }

  addBadImage(String url) {
    if (!state.contains(url)) {
      final newState = Set<String>.from(state);
      newState.add(url);
      state = newState;
    }
  }
}
