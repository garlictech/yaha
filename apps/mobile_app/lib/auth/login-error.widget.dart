import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginErrorWidget extends ConsumerWidget {
  final String error;

  const LoginErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
                "OK",
                softWrap: false,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                //           authStateNotifier.clearError();
              },
            ),
          ],
        ),
      ),
    );
  }
}
