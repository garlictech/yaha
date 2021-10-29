import 'package:dartz/dartz.dart';
import '../entities/oauth2-entity.dart';

abstract class OAuth2Repository {
  String getAuthorizeUrl();
  Future<Either<dynamic, OAuth2Entity>> signUserInWithAuthCode(String url);
}
