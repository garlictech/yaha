import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/data/auth/auth_controller.dart';

part 'logged_in_state.g.dart';

@riverpod
class LoggedInState extends _$LoggedInState {
  @override
  bool build() {
    final user = ref.watch(authControllerProvider);
    state = user != null;
    return state;
  }
}
