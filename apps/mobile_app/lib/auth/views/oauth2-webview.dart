import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';
import '../repositories/cognito-oauth2-repository.dart';
import '../states/oauth2-state.dart';
import '../utils/auth-methods.dart';

class OAuth2Webview extends ConsumerWidget {
  final AuthMethod _authMethod;
  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  OAuth2Webview(this._authMethod);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final oauthRepo = watch(oauth2RepositoryProvider(_authMethod));
    final oAuth2StateNotifier = watch(oAuth2StateProvider.notifier);

    return WebView(
      initialUrl: oauthRepo.getAuthorizeUrl(),
      javascriptMode: JavascriptMode.unrestricted,
      userAgent: "random",
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('${AppConfig.signinCallback}?code=')) {
          return oauthRepo.signUserInWithAuthCode(request.url).then((result) =>
              result.fold((err) => NavigationDecision.prevent, (tokens) {
                oAuth2StateNotifier.setTokens(tokens);
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
