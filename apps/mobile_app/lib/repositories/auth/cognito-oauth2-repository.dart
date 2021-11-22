import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app-config.dart';
import 'package:yaha/entities/auth/oauth2-entity.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

import 'oauth2-repository.dart';

class CognitoOAuth2Repository extends OAuth2Repository {
  static final _authProviderMap = {
    AuthMethod.FACEBOOK: 'Facebook',
    AuthMethod.GOOGLE: 'Google',
    AuthMethod.APPLE: 'SignInWithApple'
  };

  final AuthMethod authMethod;

  CognitoOAuth2Repository({required this.authMethod});

  @override
  String getAuthorizeUrl() {
    return '${AppConfig.userPoolDomain}/oauth2/authorize?'
        'identity_provider=${_getCognitoProviderName(authMethod)}&'
        'redirect_uri=${AppConfig.signinCallback}&'
        'response_type=CODE&'
        'client_id=${AppConfig.userPoolClientId}&'
        'scope=email%20openid%20profile%20aws.cognito.signin.user.admin';
  }

  @override
  Future<Either<dynamic, OAuth2Entity>> signUserInWithAuthCode(
      String requestUrl) async {
    final authCode =
        requestUrl.substring('${AppConfig.signinCallback}?code='.length);

    final url = '${AppConfig.userPoolDomain}/oauth2/token?'
        'grant_type=authorization_code&'
        'client_id=${AppConfig.userPoolClientId}&'
        'redirect_uri=${AppConfig.signinCallback}&'
        'code=$authCode';

    return await Dio()
        .post(url,
            data: {},
            options: Options(headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            }))
        .then((response) => (response.statusCode == 200
                ? right(response.data)
                : left(response.data))
            .flatMap((response) => catching(() {
                  final tokenRepository = response;
                  return [
                    CognitoAccessToken(tokenRepository['access_token'])
                        .getJwtToken(),
                    CognitoRefreshToken(tokenRepository['refresh_token'])
                        .getToken(),
                    CognitoIdToken(tokenRepository['id_token']).getJwtToken()
                  ];
                }))
            .flatMap((tokens) =>
                tokens.contains(null) ? left("Invalid tokens") : right(tokens))
            .map((tokens) => OAuth2Entity(
                accessToken: tokens[0],
                refreshToken: tokens[1],
                idToken: tokens[2])));
  }

  String _getCognitoProviderName(AuthMethod method) =>
      _authProviderMap[method] ?? 'Cognito';
}

final oauth2RepositoryProvider = Provider.family<OAuth2Repository, AuthMethod>(
    (_, method) => CognitoOAuth2Repository(authMethod: method));
