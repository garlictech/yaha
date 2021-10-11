import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPackage extends ConsumerWidget {
  final mockUsers = {
    'dribbble@gmail.com': '12345',
    'hunter@gmail.com': 'hunter',
    'near.huscarl@gmail.com': 'subscribe to pewdiepie',
    '@.com': '.',
  };

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FlutterLogin(
      onSignup: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      title: 'Log in with email',
      theme: LoginTheme(
        titleStyle: TextStyle(
            fontSize: YahaFontSizes.xxLarge, fontWeight: FontWeight.w600),
        inputTheme: InputDecorationTheme(
          filled: false,
          fillColor: YahaColors.accentColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(width: YahaBorderWidth.xSmall)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(YahaBorderRadius.general),
              borderSide: BorderSide(
                  width: YahaBorderWidth.xSmall, color: YahaColors.primary)),
        ),
      ),
      loginProviders: [
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            print('start google sign in');
            await Future.delayed(loginTime);
            print('stop google sign in');
            return '';
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          label: 'LinkedIn',
          callback: () async {
            print('start linkdin sign in');
            await Future.delayed(loginTime);
            print('stop linkdin sign in');
            return '';
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          label: 'GitHub',
          callback: () async {
            print('start github sign in');
            await Future.delayed(loginTime);
            print('stop github sign in');
            return '';
          },
        ),
      ],
      messages: LoginMessages(userHint: 'Email address'),
    );
  }
}
