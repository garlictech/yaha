abstract class AuthUseCases {
  loginWithFacebook();
  loginWithApple();
  loginWithGoogle();
  loginWithPassword(String username, String password);
  logout();
}
