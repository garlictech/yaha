import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';
import 'package:yaha/auth/auth-state.dart';

import 'cognito/auth-methods.dart';

class OAuth2Support {
  static final _authProviderMap = {
    AuthMethod.FACEBOOK: 'Facebook',
    AuthMethod.GOOGLE: 'Google',
    AuthMethod.APPLE: 'SignInWithApple'
  };

  final AuthMethod? authMethod;

  OAuth2Support({this.authMethod});

  String authorizeUrl() {
    return '${AppConfig.userPoolDomain}/oauth2/authorize?'
        'identity_provider=$_getCognitoProviderName(authMethod)&'
        'redirect_uri=${AppConfig.signinCallback}&'
        'response_type=CODE&'
        'client_id=${AppConfig.userPoolClientId}&'
        'scope=email%20openid%20profile%20aws.cognito.signin.user.admin';
  }

  signUserInWithAuthCode(NavigationRequest request) async {
    if (request.url.startsWith('${AppConfig.signinCallback}?code=')) {
      final authCode =
          request.url.substring('${AppConfig.signinCallback}?code='.length);

      final url = '${AppConfig.userPoolDomain}/oauth2/token?'
          'grant_type=authorization_code&'
          'client_id=${AppConfig.userPoolClientId}&'
          'code=$authCode&'
          'redirect_uri=${AppConfig.signinCallback}';

      final response = await Dio().post(
        url,
        data: {},
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }),
      );

      (response.statusCode == 200 ? right(response.data) : left(response.data))
          .flatMap((response) => catching(() {
                final tokenData = json.decode(response);
                final idToken = CognitoIdToken(tokenData['id_token']);
                final accessToken =
                    CognitoAccessToken(tokenData['access_token']);
                final refreshToken =
                    CognitoRefreshToken(tokenData['refresh_token']);
                dynamic payload = idToken.decodePayload();
                String username = payload['cognito:username'];
              }))
          .fold((body) {}, (r) => null);

      return NavigationDecision.prevent;
    } else {
      return NavigationDecision.navigate;
    }
  }

  String _getCognitoProviderName(AuthMethod method) =>
      _authProviderMap[method] ?? 'Cognito';
}

final oauth2SupportProvider = Provider<OAuth2Support>((ref) {
  final authState = ref.watch(authStateProvider);
  return OAuth2Support(authMethod: authState.ongoingAuthMethod);
});
