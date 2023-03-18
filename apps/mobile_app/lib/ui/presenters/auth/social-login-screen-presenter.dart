import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yaha/app-config.dart';
import 'package:yaha/domain/repositories/auth/cognito-oauth2-repository.dart';
import 'package:yaha/domain/states/auth/oauth2-state.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

import '../../viewmodels/auth/social-login-screen-viewmodel.dart';

class SocialLoginScreenPresenter
    extends StateNotifier<SocialLoginScreenViewModel> {
  final BuildContext context;
  final Ref ref;

  SocialLoginScreenPresenter(
      {required this.context, required this.ref, required bool loggedIn})
      : super(SocialLoginScreenViewModel(loggedIn: loggedIn));

  getOauthRepo(AuthMethod method) => ref.read(oauth2RepositoryProvider(method));

  processRequests(AuthMethod method) {
    return (NavigationRequest request) {
      {
        final oauthRepo = getOauthRepo(method);
        final oAuth2StateNotifier = ref.read(oAuth2StateProvider.notifier);
        final oAuth2State = ref.read(oAuth2StateProvider);

        if (oAuth2State.loggedIn) {
          debugPrint("LOGGED IN");
          Navigator.pop(context);
        }

        if (request.url.startsWith('${AppConfig.signinCallback}?code=')) {
          return oauthRepo.signUserInWithAuthCode(request.url).then((result) =>
              result.fold((err) => NavigationDecision.prevent, (tokens) {
                oAuth2StateNotifier.setTokens(tokens);
                return NavigationDecision.navigate;
              }));
        } else {
          return NavigationDecision.navigate;
        }
      }
    };
  }

  getAuthorizeUrl(AuthMethod method) {
    return getOauthRepo(method).getAuthorizeUrl();
  }
}

final socialLoginScreenMVPProvider = StateNotifierProvider.family<
    SocialLoginScreenPresenter,
    SocialLoginScreenViewModel,
    BuildContext>((ref, context) {
  final oAuth2State = ref.watch(oAuth2StateProvider);

  return SocialLoginScreenPresenter(
      context: context, ref: ref, loggedIn: oAuth2State.loggedIn);
});
