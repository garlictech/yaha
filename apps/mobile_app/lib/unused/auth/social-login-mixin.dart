import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utils/auth/auth-methods.dart';

import '../../ui/views/auth/screens/social-login-screen.dart';

mixin SocialLogin {
  late BuildContext _context;
  BuildContext get buildContext => _context;
  set buildContext(BuildContext c) => _context = c;

  late final Ref _ref;
  get ref => _ref;
  set ref(r) => _ref = r;

  doFacebookLogin() => _doSocialLogin(AuthMethod.FACEBOOK);

  doGoogleLogin() => _doSocialLogin(AuthMethod.GOOGLE);

  doAppleLogin() => _doSocialLogin(AuthMethod.APPLE);

  _doSocialLogin(AuthMethod method) {
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (context) => SocialLoginScreen(method: method)));
  }
}
