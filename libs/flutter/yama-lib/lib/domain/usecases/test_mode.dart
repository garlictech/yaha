import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_mode.g.dart';

@riverpod
class TestMode extends _$TestMode {
  @override
  bool build() {
    return false;
  }
}
