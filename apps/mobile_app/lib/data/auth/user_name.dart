import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/data/auth/auth_controller.dart';

part 'user_name.g.dart';

@riverpod
class UserName extends _$UserName {
  @override
  String? build() {
    final user = ref.watch(authControllerProvider);
    state = user?.displayName ?? 'Dear';
    return state;
  }
}
