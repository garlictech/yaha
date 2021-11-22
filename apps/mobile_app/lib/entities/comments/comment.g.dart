// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Comment {
  const $Comment();

  String get title;
  String get body;
  String get ownerId;

  Comment copyWith({
    String? title,
    String? body,
    String? ownerId,
  }) =>
      Comment(
        title: title ?? this.title,
        body: body ?? this.body,
        ownerId: ownerId ?? this.ownerId,
      );

  Comment copyUsing(void Function(Comment$Change change) mutator) {
    final change = Comment$Change._(
      this.title,
      this.body,
      this.ownerId,
    );
    mutator(change);
    return Comment(
      title: change.title,
      body: change.body,
      ownerId: change.ownerId,
    );
  }

  @override
  String toString() => "Comment(title: $title, body: $body, ownerId: $ownerId)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Comment &&
      other.runtimeType == runtimeType &&
      title == other.title &&
      body == other.body &&
      ownerId == other.ownerId;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + title.hashCode;
    result = 37 * result + body.hashCode;
    result = 37 * result + ownerId.hashCode;
    return result;
  }
}

class Comment$Change {
  Comment$Change._(
    this.title,
    this.body,
    this.ownerId,
  );

  String title;
  String body;
  String ownerId;
}

// ignore: avoid_classes_with_only_static_members
class Comment$ {
  static final title = Lens<Comment, String>(
    (titleContainer) => titleContainer.title,
    (titleContainer, title) => titleContainer.copyWith(title: title),
  );

  static final body = Lens<Comment, String>(
    (bodyContainer) => bodyContainer.body,
    (bodyContainer, body) => bodyContainer.copyWith(body: body),
  );

  static final ownerId = Lens<Comment, String>(
    (ownerIdContainer) => ownerIdContainer.ownerId,
    (ownerIdContainer, ownerId) => ownerIdContainer.copyWith(ownerId: ownerId),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    title: json['title'] as String,
    body: json['body'] as String,
    ownerId: json['ownerId'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'ownerId': instance.ownerId,
    };
