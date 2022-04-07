import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/states/auth/auth-state.dart';

part 'user-state.g.dart';

@FunctionalData()
class UserState extends $UserState {
  final String avatarImage;
  final String nick;

  UserState(
      {this.avatarImage = 'assets/images/profile-unauth.png',
      this.nick = 'yahaer'});
}

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier() : super(UserState());

  updateState(UserState newState) => state = newState;
}

final userStateProvider = FutureProvider<UserState>((ref) async {
  final authState = ref.watch(authStateProvider);

  return authState.loggedIn
      ? UserState(
          avatarImage: 'assets/images/profile-authenticated.png',
          nick: "Test Elek")
      : UserState();
});
