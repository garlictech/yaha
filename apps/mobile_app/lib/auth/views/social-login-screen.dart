import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/auth-methods.dart';
import 'oauth2-webview.dart';

@immutable
class SocialLoginScreen extends StatelessWidget {
  final AuthMethod method;

  SocialLoginScreen({required this.method}) : super();

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
        body: Stack(children: [OAuth2Webview(method)]));
  }
}
