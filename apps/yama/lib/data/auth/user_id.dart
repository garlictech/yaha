import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_controller.dart';

part 'user_id.g.dart';

@riverpod
class UserId extends _$UserId {
  @override
  String? build() {
    final user = ref.watch(authControllerProvider);
    return user?.uid;
  }
}
