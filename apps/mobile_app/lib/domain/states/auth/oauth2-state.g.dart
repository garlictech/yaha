// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth2-state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuth2State _$OAuth2StateFromJson(Map<String, dynamic> json) => OAuth2State(
      tokens: json['tokens'] == null
          ? null
          : OAuth2Entity.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OAuth2StateToJson(OAuth2State instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tokens', instance.tokens?.toJson());
  return val;
}
