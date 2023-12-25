import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@FunctionalData()
@JsonSerializable()
class Comment extends $Comment {
  @override
  final String body;
  @override
  final String ownerId;
  @override
  final String ownerName;
  @override
  final String profilePicture;
  @override
  final String date;

  Comment(
      {required this.body,
      required this.ownerId,
      required this.ownerName,
      required this.profilePicture,
      required this.date});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
