import 'dart:convert';
import 'amplifyconfiguration.dart';

class AppConfig {
  static String get region => _config['Region'];
  static String get stage => _config['Stage'];
  static String get identityPoolId => _config['IdentityPoolId'];
  static String get userPoolId => _config['ConsumerUserPoolId'];
  static String get userPoolClientId => _config['ConsumerWebUserPoolClientId'];
  static String get userPoolDomain => _config['ConsumerUserPoolDomain'];
  static String signinCallback = 'yaha://signin/';
  static String signoutCallback = 'yaha://signout/';
  static Map<String, dynamic> _config = jsonDecode(amplifyconfig);
  static Map<String, dynamic> get config => _config;

  AppConfig._();

  @override
  String toString() {
    return 'AwsConfig[config=$_config]';
  }
}
