import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yaha/ui/presenters/auth/social-login-screen-presenter.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

import '../../shared/shared.dart';

@immutable
class SocialLoginScreen extends ConsumerWidget {
  final AuthMethod method;

  const SocialLoginScreen({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(socialLoginScreenMVPProvider(context).notifier);
    final viewModel = ref.watch(socialLoginScreenMVPProvider(context));

    return Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: const EdgeInsets.only(
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
              child: const YahaBackButton(),
            ),
          ),
          elevation: 0.0,
          iconTheme: const IconThemeData(),
          title: Text(
            "signin",
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(children: [
          viewModel.loggedIn
              ? const Text("You have logged in successfully")
              : WebView(
                  initialUrl: presenter.getAuthorizeUrl(method),
                  javascriptMode: JavascriptMode.unrestricted,
                  userAgent: "random",
                  navigationDelegate: (NavigationRequest request) =>
                      presenter.processRequests(method)(request),
                  gestureNavigationEnabled: true,
                )
        ]));
  }
}
