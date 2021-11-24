// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Comment {
  const $Comment();

  String get body;
  String get ownerId;
  String get ownerName;
  String get profilePicture;
  String get date;

  Comment copyWith({
    String? body,
    String? ownerId,
    String? ownerName,
    String? profilePicture,
    String? date,
  }) =>
      Comment(
        body: body ?? this.body,
        ownerId: ownerId ?? this.ownerId,
        ownerName: ownerName ?? this.ownerName,
        profilePicture: profilePicture ?? this.profilePicture,
        date: date ?? this.date,
      );

  Comment copyUsing(void Function(Comment$Change change) mutator) {
    final change = Comment$Change._(
      this.body,
      this.ownerId,
      this.ownerName,
      this.profilePicture,
      this.date,
    );
    mutator(change);
    return Comment(
      body: change.body,
      ownerId: change.ownerId,
      ownerName: change.ownerName,
      profilePicture: change.profilePicture,
      date: change.date,
    );
  }

  @override
  String toString() =>
      "Comment(body: $body, ownerId: $ownerId, ownerName: $ownerName, profilePicture: $profilePicture, date: $date)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Comment &&
      other.runtimeType == runtimeType &&
      body == other.body &&
      ownerId == other.ownerId &&
      ownerName == other.ownerName &&
      profilePicture == other.profilePicture &&
      date == other.date;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + body.hashCode;
    result = 37 * result + ownerId.hashCode;
    result = 37 * result + ownerName.hashCode;
    result = 37 * result + profilePicture.hashCode;
    result = 37 * result + date.hashCode;
    return result;
  }
}

class Comment$Change {
  Comment$Change._(
    this.body,
    this.ownerId,
    this.ownerName,
    this.profilePicture,
    this.date,
  );

  String body;
  String ownerId;
  String ownerName;
  String profilePicture;
  String date;
}

// ignore: avoid_classes_with_only_static_members
class Comment$ {
  static final body = Lens<Comment, String>(
    (bodyContainer) => bodyContainer.body,
    (bodyContainer, body) => bodyContainer.copyWith(body: body),
  );

  static final ownerId = Lens<Comment, String>(
    (ownerIdContainer) => ownerIdContainer.ownerId,
    (ownerIdContainer, ownerId) => ownerIdContainer.copyWith(ownerId: ownerId),
  );

  static final ownerName = Lens<Comment, String>(
    (ownerNameContainer) => ownerNameContainer.ownerName,
    (ownerNameContainer, ownerName) =>
        ownerNameContainer.copyWith(ownerName: ownerName),
  );

  static final profilePicture = Lens<Comment, String>(
    (profilePictureContainer) => profilePictureContainer.profilePicture,
    (profilePictureContainer, profilePicture) =>
        profilePictureContainer.copyWith(profilePicture: profilePicture),
  );

  static final date = Lens<Comment, String>(
    (dateContainer) => dateContainer.date,
    (dateContainer, date) => dateContainer.copyWith(date: date),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    body: json['body'] as String,
    ownerId: json['ownerId'] as String,
    ownerName: json['ownerName'] as String,
    profilePicture: json['profilePicture'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'body': instance.body,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'profilePicture': instance.profilePicture,
      'date': instance.date,
    };
