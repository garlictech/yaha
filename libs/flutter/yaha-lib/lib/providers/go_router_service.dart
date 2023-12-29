import 'package:flutter_yaha_lib/data/auth/logged_in_state.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/presentation.dart';

part 'go_router_service.g.dart';

@riverpod
class GoRouterService extends _$GoRouterService {
  @override
  GoRouter build() {
    final isLoggedIn = ref.watch(loggedInStateProvider);

    return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) =>
                isLoggedIn ? const MainScreen() : const LoginScreen()),
      ],
    );
  }
}
