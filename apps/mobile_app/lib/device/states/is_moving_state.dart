import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_moving_state.g.dart';

@riverpod
class IsMovingState extends _$IsMovingState {
  @override
  Stream<bool> build() {
    return Stream.fromIterable([true]);
  }
}
