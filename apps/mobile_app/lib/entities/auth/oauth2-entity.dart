import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oauth2-entity.g.dart';

@FunctionalData()
@JsonSerializable()
class OAuth2Entity extends $OAuth2Entity {
  final String refreshToken;
  final String accessToken;
  final String idToken;

  OAuth2Entity(
      {required this.refreshToken,
      required this.accessToken,
      required this.idToken});

  OAuth2Entity.empty() : this(refreshToken: '', accessToken: '', idToken: '');

  factory OAuth2Entity.fromJson(Map<String, dynamic> json) =>
      _$OAuth2EntityFromJson(json);

  Map<String, dynamic> toJson() => _$OAuth2EntityToJson(this);
}
