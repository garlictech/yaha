import 'package:yaha/domain/states/auth/oauth2-state.dart';

import 'auth-use-cases.dart';

class AuthUseCasesOAuth2 extends AuthUseCases {
  final OAuth2StateNotifier oAuth2StateNotifier;

  AuthUseCasesOAuth2({required this.oAuth2StateNotifier});

  loginWithFacebook() {}
  loginWithApple() {}
  loginWithGoogle() {}
  loginWithPassword(String username, String password) {}
  logout() {
    print("LOGOUT");
    oAuth2StateNotifier.clearTokens();
  }
}
