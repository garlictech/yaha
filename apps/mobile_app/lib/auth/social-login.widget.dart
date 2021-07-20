import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';
import 'package:yaha/core/logger.dart';
import 'auth-state.dart';
//import 'auth_repository.dart';
import 'cognito/login_methods.dart';
import 'login-error.widget.dart';

class Deps {
  static final Logger l = logger;
  static final String signinCallback = AppConfig.signinCallback;
  static final String userPoolClientId = AppConfig.userPoolClientId;
  static final String userPoolDomain = AppConfig.userPoolDomain;
  final AuthStateNotifier stateNotifier;

  Deps({
    required this.stateNotifier,
  });
}

@immutable
class SocialLoginWidget extends ConsumerWidget {
  final String title = "fasz";
  final LoginMethod method = LoginMethod.FACEBOOK;
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  SocialLoginWidget() : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    String provider = getCognitoProviderName(method);
    final authStateNotifier = watch(authStateProvider.notifier);
    final authState = watch(authStateProvider);
    final error = authState.error;
    final loginMethod = authState.loginMethod;
    final working = authState.working;
    final deps = Deps(stateNotifier: authStateNotifier);

    final url = '${AppConfig.userPoolDomain}/oauth2/authorize?'
        'identity_provider=$provider&'
        'redirect_uri=${AppConfig.signinCallback}&'
        'response_type=CODE&'
        'client_id=${AppConfig.userPoolClientId}&'
        'scope=email%20openid%20profile%20aws.cognito.signin.user.admin';

    logger.d('Social login url: $url');

    return Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                ),
              ),
              child: BackButton(
                onPressed: () => authStateNotifier.finishSocialLogin(),
              ),
            ),
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(),
          title: Text(
            "signin",
            //trans("login.email.signIn"),
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(children: [
          working ? Center(child: CircularProgressIndicator()) : Container(),
          error != null ? LoginErrorWidget(error: error) : Container(),
          loginMethod != null
              ? WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _webViewController.complete(webViewController);
                    authStateNotifier.waiting();
                  },
                  navigationDelegate: (NavigationRequest request) =>
                      signUserInWithAuthCode(request)(deps),
                  gestureNavigationEnabled: true,
                )
              : Container()
        ]));
  }

  static signUserInWithAuthCode(NavigationRequest request) =>
      (Deps deps) async {
        Deps.l.d('Navigation request: $request');

        if (request.url.startsWith('${Deps.signinCallback}?code=')) {
          final authCode =
              request.url.substring('${Deps.signinCallback}?code='.length);
          Deps.l.d('authCode: $authCode');

          final url = '${Deps.userPoolDomain}/oauth2/token?'
              'grant_type=authorization_code&'
              'client_id=${Deps.userPoolClientId}&'
              'code=$authCode&'
              'redirect_uri=${Deps.signinCallback}';

          Deps.l.d('url: $url');

          final response = await http.post(
            Uri.parse(url),
            body: {},
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          );

          Deps.l.d('response status code: ${response.statusCode}');
          Deps.l.d('response body: ${response.body}');

          (response.statusCode == 200
                  ? right(response.body)
                  : left(response.body))
              .flatMap((response) => catching(() {
                    final tokenData = json.decode(response);
                    final idToken = CognitoIdToken(tokenData['id_token']);
                    final accessToken =
                        CognitoAccessToken(tokenData['access_token']);
                    final refreshToken =
                        CognitoRefreshToken(tokenData['refresh_token']);

                    Deps.l.v('idToken: ${idToken.jwtToken}');
                    Deps.l.v('accessToken: ${accessToken.jwtToken}');
                    Deps.l.v('refreshToken: ${refreshToken.token}');

                    dynamic payload = idToken.decodePayload();
                    String username = payload['cognito:username'];
                    Deps.l.v('username: $username');
                    deps.stateNotifier.loggedIn();
                  }))
              .fold((body) {
            Deps.l.e('Cognito error happened: $body');
            deps.stateNotifier.errorHappened(JsonEncoder().convert(body));
          }, (r) => null);

          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      };
}
