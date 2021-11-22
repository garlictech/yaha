import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@FunctionalData()
@JsonSerializable()
class Comment extends $Comment {
  final String body;
  final String ownerId;
  final String ownerName;
  final String profilePicture;
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
