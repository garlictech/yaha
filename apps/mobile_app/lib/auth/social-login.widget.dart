import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'domain/auth-state.dart';
import 'domain/use-cases/sign-in.dart';
import 'login-error.widget.dart';

@immutable
class SocialLoginWidget extends ConsumerWidget {
  SocialLoginWidget() : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateNotifier = watch(authStateProvider.notifier);
    final authState = watch(authStateProvider);
    final error = authState.error;
    final ongoingAuthMethod = authState.ongoingAuthMethod;

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
                onPressed: () => authStateNotifier.cancelLogin(),
              ),
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
          authState.working
              ? Center(child: CircularProgressIndicator())
              : Container(),
          error != null ? LoginErrorWidget(error: error) : Container(),
          ongoingAuthMethod != null ? SignIn(ongoingAuthMethod) : Container()
        ]));
  }
}
