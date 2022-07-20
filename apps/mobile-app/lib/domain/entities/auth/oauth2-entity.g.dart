// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth2-entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $OAuth2Entity {
  const $OAuth2Entity();

  String get refreshToken;
  String get accessToken;
  String get idToken;

  OAuth2Entity copyWith({
    String? refreshToken,
    String? accessToken,
    String? idToken,
  }) =>
      OAuth2Entity(
        refreshToken: refreshToken ?? this.refreshToken,
        accessToken: accessToken ?? this.accessToken,
        idToken: idToken ?? this.idToken,
      );

  OAuth2Entity copyUsing(void Function(OAuth2Entity$Change change) mutator) {
    final change = OAuth2Entity$Change._(
      this.refreshToken,
      this.accessToken,
      this.idToken,
    );
    mutator(change);
    return OAuth2Entity(
      refreshToken: change.refreshToken,
      accessToken: change.accessToken,
      idToken: change.idToken,
    );
  }

  @override
  String toString() =>
      "OAuth2Entity(refreshToken: $refreshToken, accessToken: $accessToken, idToken: $idToken)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is OAuth2Entity &&
      other.runtimeType == runtimeType &&
      refreshToken == other.refreshToken &&
      accessToken == other.accessToken &&
      idToken == other.idToken;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + refreshToken.hashCode;
    result = 37 * result + accessToken.hashCode;
    result = 37 * result + idToken.hashCode;
    return result;
  }
}

class OAuth2Entity$Change {
  OAuth2Entity$Change._(
    this.refreshToken,
    this.accessToken,
    this.idToken,
  );

  String refreshToken;
  String accessToken;
  String idToken;
}

// ignore: avoid_classes_with_only_static_members
class OAuth2Entity$ {
  static final refreshToken = Lens<OAuth2Entity, String>(
    (refreshTokenContainer) => refreshTokenContainer.refreshToken,
    (refreshTokenContainer, refreshToken) =>
        refreshTokenContainer.copyWith(refreshToken: refreshToken),
  );

  static final accessToken = Lens<OAuth2Entity, String>(
    (accessTokenContainer) => accessTokenContainer.accessToken,
    (accessTokenContainer, accessToken) =>
        accessTokenContainer.copyWith(accessToken: accessToken),
  );

  static final idToken = Lens<OAuth2Entity, String>(
    (idTokenContainer) => idTokenContainer.idToken,
    (idTokenContainer, idToken) => idTokenContainer.copyWith(idToken: idToken),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuth2Entity _$OAuth2EntityFromJson(Map<String, dynamic> json) => OAuth2Entity(
      refreshToken: json['refreshToken'] as String,
      accessToken: json['accessToken'] as String,
      idToken: json['idToken'] as String,
    );

Map<String, dynamic> _$OAuth2EntityToJson(OAuth2Entity instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'idToken': instance.idToken,
    };
