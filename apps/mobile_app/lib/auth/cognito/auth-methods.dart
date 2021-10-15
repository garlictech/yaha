enum AuthMethod { FACEBOOK, GOOGLE, PHONE, APPLE, ANONYMOUS, EMAIL, UNKNOWN }
/*final loginProviderMap = {
  LoginMethod.FACEBOOK: 'Facebook',
  LoginMethod.GOOGLE: 'Google',
  LoginMethod.APPLE: 'SignInWithApple'
};

final getCognitoProviderName =
    (LoginMethod method) => loginProviderMap[method] ?? 'Cognito';

class LoginMethodUtils {
  static String methodToString(LoginMethod method) {
    switch (method) {
      case LoginMethod.APPLE:
        return 'apple.com';
      case LoginMethod.FACEBOOK:
        return 'facebook.com';
      case LoginMethod.GOOGLE:
        return 'google.com';
      default:
        return method.toString();
    }
  }

  static LoginMethod stringToMethod(String method) {
    switch (method) {
      case 'apple.com':
        return LoginMethod.APPLE;
      case 'facebook.com':
        return LoginMethod.FACEBOOK;
      case 'google.com':
        return LoginMethod.GOOGLE;
      case 'phone':
        return LoginMethod.PHONE;
      case 'email':
        return LoginMethod.EMAIL;
      default:
        return LoginMethod.UNKNOWN;
    }
  }
}*/
