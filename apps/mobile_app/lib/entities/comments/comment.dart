import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@FunctionalData()
@JsonSerializable()
class Comment extends $Comment {
  final String title;
  final String body;
  final String ownerId;

  Comment({required this.title, required this.body, required this.ownerId});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
