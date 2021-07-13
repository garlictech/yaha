import 'dart:convert';
import 'awsconfiguration.dart';

class AppConfig {
  static String get region => _config['Region'];
  static String get stage => _config['Stage'];
  //static String get crudGraphqlApiUrl => _config['CrudGraphqlApiUrl'];
  //static String get crudGraphqlApiKey => _config['CrudGraphqlApiKey'];
  static String get identityPoolId => _config['IdentityPoolId'];
  static String get userPoolId => _config['ConsumerUserPoolId'];
  static String get userPoolClientId => _config['ConsumerWebUserPoolClientId'];
  static String get userPoolDomain => _config['ConsumerUserPoolDomain'];
  static String signinCallback = 'yaha://signin/';
  static String signoutCallback = 'yaha://signout/';
  //static String get S3BucketName => _config['S3BucketName'];
  static Map<String, dynamic> _config = jsonDecode(AWSCONFIG);
  static Map<String, dynamic> get config => _config;

  AppConfig._();

  @override
  String toString() {
    return 'AwsConfig[config=$_config]';
  }
}