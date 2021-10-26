import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yaha/utility/buttons/back-button.dart';

import '../../utils/auth-methods.dart';
import '../../presenters/social-login-screen-presenter.dart';

@immutable
class SocialLoginScreen extends ConsumerWidget {
  final AuthMethod method;

  SocialLoginScreen({required this.method}) : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final presenter = watch(socialLoginScreenMVPProvider(context).notifier);
    final viewModel = watch(socialLoginScreenMVPProvider(context));

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
              child: YahaBackButton(),
            ),
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(),
          title: Text(
            "signin",
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(children: [
          viewModel.loggedIn
              ? Text("You have logged in successfully")
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
