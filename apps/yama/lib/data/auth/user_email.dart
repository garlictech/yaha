import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_controller.dart';

part 'user_email.g.dart';

@riverpod
class UserEmail extends _$UserEmail {
  @override
  String? build() {
    final user = ref.watch(authControllerProvider);
    return user?.email;
  }
}
