import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:yaha/sign-up-with-email-page.dart';
import 'package:yaha/yaha-border-radius.dart';
import 'package:yaha/yaha-box-sizes.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app-config.dart';
import 'auth/cognito/login_methods.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthState {
  final LoginMethod? socialLoginStarted;
  final String? error;

  AuthState({this.socialLoginStarted, this.error});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState());

  startSocialLogin(LoginMethod method) =>
      state = AuthState(socialLoginStarted: method);

  errorHappened(String error) =>
      state = AuthState(socialLoginStarted: null, error: error);
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());

class SignUpPage extends ConsumerWidget {
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authStateProvider);

    if (authState.socialLoginStarted == LoginMethod.FACEBOOK) {
      final provider = 'Facebook';

      var url = '${AppConfig.userPoolDomain}/oauth2/authorize?'
          'identity_provider=$provider&'
          'redirect_uri=${AppConfig.signinCallback}&'
          'response_type=CODE&'
          'client_id=${AppConfig.userPoolClientId}&'
          'scope=email%20openid%20profile%20aws.cognito.signin.user.admin';
      print('SocialLoginScreen.getWebView().url=$url');

      return WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) {
          print('SocialLoginScreen.navigationDelegate().request=$request');

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
      );
    } else {
      return SignUpPageBase();
    }
  }

  Future signUserInWithAuthCode(BuildContext context, String authCode) async {
    print('SocialLoginScreen.signUserInWithAuthCode().authCode=$authCode');
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
        'SocialLoginScreen.signUserInWithAuthCode().response=${response.statusCode}');
    print(
        'SocialLoginScreen.signUserInWithAuthCode().response.body=${response.body}');
    if (response.statusCode != 200) {
      print('${response.statusCode}: ${response.body}');
      return;
      // throw Exception('Received bad status code from Cognito for auth code:' +
      //     response.statusCode.toString() +
      //     '; body: ' +
      //     response.body);
    }

    try {
      final tokenData = json.decode(response.body);
      final idToken = CognitoIdToken(tokenData['id_token']);
      final accessToken = CognitoAccessToken(tokenData['access_token']);
      final refreshToken = CognitoRefreshToken(tokenData['refresh_token']);
      print(
          'SocialLoginScreen.signUserInWithAuthCode().idToken=${idToken.jwtToken}');
      print(
          'SocialLoginScreen.signUserInWithAuthCode().accessToken=${accessToken.jwtToken}');
      print(
          'SocialLoginScreen.signUserInWithAuthCode().refreshToken=${refreshToken.token}');
      dynamic payload = idToken.decodePayload();
      String username = payload['cognito:username'];
      print('SocialLoginScreen()signUserInWithAuthCode().username=' + username);

      //final session =
      //    CognitoUserSession(idToken, accessToken, refreshToken: refreshToken);
      //AuthRepository repository = getIt<AuthRepository>();
      //await repository.loginWithCognitoSession(session, username);

      Navigator.of(context).pop();
    } on Exception catch (e) {
      print('UNKNOWN_ERROR: $e');
    }
  }
}

class SignUpPageBase extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateNotifier = watch(authStateProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 195.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('New to YAHA?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w500)),
                  const Text(
                    "Create an account!",
                    style: TextStyle(
                        fontSize: YahaFontSizes.medium,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              background: Image.asset(
                'assets/images/top-picture.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                          top: YahaSpaceSizes.large),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                new MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) {
                              return new SignUpWithEmailPage();
                            }));
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.mail_outline_rounded,
                                    color: YahaColors.accentColor,
                                    size: YahaFontSizes.xLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with email',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Icon(
                          //Icons.mail_outline_rounded,
                          //color: YahaColors.accentColor,
                          //size: YahaFontSizes.large,
                          //),

                          //label: Text('Sign up with email',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    'assets/images/facebook_logo@3x.png',
                                    height: 28.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with Facebook',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Icon(
                          //Icons.facebook_rounded,
                          //color: YahaColors.accentColor,
                          //size: YahaFontSizes.large,
                          //),
                          onPressed: () => authStateNotifier
                              .startSocialLogin(LoginMethod.FACEBOOK),
                          //label: Text('Sign up with Facebook',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.facebook,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  'assets/images/btn_google_dark_normal_ios@3x.png',
                                  height: 40.0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.google,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                    'assets/images/apple_logo@3x.png',
                                    height: 26.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with Apple',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Image.asset(
                          //'assets/images/apple_logo@3x.png',
                          //height: 25.0,
                          //),
                          onPressed: () {},
                          //label: Text('Sign up with Apple',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.apple,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: YahaFontSizes.small)),
                            Text('Log in',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.primary,
                                    fontSize: YahaFontSizes.small)),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
