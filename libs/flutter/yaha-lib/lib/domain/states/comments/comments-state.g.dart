// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $CommentsState {
  const $CommentsState();

  List<Comment> get comments;

  CommentsState copyWith({
    List<Comment>? comments,
  }) =>
      CommentsState(
        comments: comments ?? this.comments,
      );

  CommentsState copyUsing(void Function(CommentsState$Change change) mutator) {
    final change = CommentsState$Change._(
      this.comments,
    );
    mutator(change);
    return CommentsState(
      comments: change.comments,
    );
  }

  @override
  String toString() => "CommentsState(comments: $comments)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is CommentsState &&
      other.runtimeType == runtimeType &&
      comments == other.comments;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return comments.hashCode;
  }
}

class CommentsState$Change {
  CommentsState$Change._(
    this.comments,
  );

  List<Comment> comments;
}

// ignore: avoid_classes_with_only_static_members
class CommentsState$ {
  static final comments = Lens<CommentsState, List<Comment>>(
    (commentsContainer) => commentsContainer.comments,
    (commentsContainer, comments) =>
        commentsContainer.copyWith(comments: comments),
  );
}
