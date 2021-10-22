import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';
import 'package:yaha/auth/cognito/auth-methods.dart';
import 'package:yaha/auth/domain/repositories/cognito-oauth2-repository.dart';

class SignIn extends ConsumerWidget {
  final AuthMethod _authMethod;
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  SignIn(this._authMethod);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final oauthRepo = watch(oauth2RepositoryProvider(_authMethod));

    print("START: ${oauthRepo.getAuthorizeUrl()}");
    return WebView(
      initialUrl: oauthRepo.getAuthorizeUrl(),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        final x = request.url.startsWith('${AppConfig.signinCallback}?code=');
        print("******1: $x");

        if (request.url.startsWith('${AppConfig.signinCallback}?code=')) {
          print('******2');
          return oauthRepo
              .signUserInWithAuthCode(request.url)
              .then((result) => result.fold((err) {
                    print("Login error: $err");
                    return NavigationDecision.prevent;
                  }, (tokens) {
                    print("Login success: $tokens");
                    return NavigationDecision.navigate;
                  }));
        } else {
          return NavigationDecision.navigate;
        }
      },
      gestureNavigationEnabled: true,
    );
  }
}
