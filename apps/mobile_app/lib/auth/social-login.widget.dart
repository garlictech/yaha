import 'dart:async';
import 'dart:convert';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:yaha/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';

import 'auth-state.dart';
import 'cognito/login_methods.dart';

class SocialLoginWidget extends StatefulWidget {
  final String title;
  final LoginMethod method;
  bool isLoading = true;

  SocialLoginWidget(
      {required Key key, required this.title, required this.method})
      : super(key: key);

  @override
  _SocialLoginWidgetState createState() => _SocialLoginWidgetState();
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    String provider;

    switch (widget.method) {
      case LoginMethod.FACEBOOK:
        provider = 'Facebook';
        break;
      case LoginMethod.GOOGLE:
        provider = 'Google';
        break;
      case LoginMethod.APPLE:
        provider = 'SignInWithApple';
        break;
      default:
        provider = 'Cognito';
    }

    var url = '${AppConfig.userPoolDomain}/oauth2/authorize?'
        'identity_provider=$provider&'
        'redirect_uri=${AppConfig.signinCallback}&'
        'response_type=CODE&'
        'client_id=${AppConfig.userPoolClientId}&'
        'scope=email%20openid%20profile%20aws.cognito.signin.user.admin';

    print('SocialLoginWidget.getWebView().url=$url');

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
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                },
              ),
            ),
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(),
          title: Text(
            trans("login.email.signIn"),
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
            //getLocalizedText(context, widget.item.name),
          ),
        ),
        body: Stack(children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              print('SocialLoginWidget.navigationDelegate().request=$request');

              if (request.url.startsWith('${AppConfig.signinCallback}?code=')) {
                var code = request.url
                    .substring('${AppConfig.signinCallback}?code='.length);
                // This is the authorization code!!!
                signUserInWithAuthCode(context, code);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            gestureNavigationEnabled: true,
          )
        ]));
  }

  Future signUserInWithAuthCode(BuildContext context, String authCode) async {
    print('SocialLoginWidget.signUserInWithAuthCode().authCode=$authCode');
    var url = '${AppConfig.userPoolDomain}/oauth2/token?'
        'grant_type=authorization_code&'
        'client_id=${AppConfig.userPoolClientId}&'
        'code=$authCode&'
        'redirect_uri=${AppConfig.signinCallback}';
    final response = await http.post(
      Uri.parse(url),
      body: {},
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    print(
        'SocialLoginWidget.signUserInWithAuthCode().response=${response.statusCode}');
    print(
        'SocialLoginWidget.signUserInWithAuthCode().response.body=${response.body}');
    if (response.statusCode != 200) {
      print('${response.statusCode}: ${response.body}');
      return;
    }

    try {
      final tokenData = json.decode(response.body);
      final idToken = CognitoIdToken(tokenData['id_token']);
      final accessToken = CognitoAccessToken(tokenData['access_token']);
      final refreshToken = CognitoRefreshToken(tokenData['refresh_token']);
      print(
          'SocialLoginWidget.signUserInWithAuthCode().idToken=${idToken.jwtToken}');
      print(
          'SocialLoginWidget.signUserInWithAuthCode().accessToken=${accessToken.jwtToken}');
      print(
          'SocialLoginWidget.signUserInWithAuthCode().refreshToken=${refreshToken.token}');
      dynamic payload = idToken.decodePayload();
      String username = payload['cognito:username'];
      print('SocialLoginWidget()signUserInWithAuthCode().username=' + username);

      final session =
          CognitoUserSession(idToken, accessToken, refreshToken: refreshToken);
      //AuthRepository repository = getIt<AuthRepository>();
      await repository.loginWithCognitoSession(session, username);

      Navigator.of(context).pop();
    } on Exception catch (e) {
      setState(() {
        _error = 'UNKNOWN_ERROR: $e';
      });
    }
  }
}

class LoginError extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateNotifier = watch(authStateProvider.notifier);
    final authState = watch(authStateProvider);
    final error = authState.error;

    if (error == null) {
      throw "Error message cannto be null";
    }

    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF30BF60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                trans('login.email.buttonLogin'),
                softWrap: false,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: theme.text2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                authStateNotifier.clearError();
              },
            ),
          ],
        ),
      ),
    );
  }
}
