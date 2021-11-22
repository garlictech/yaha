import 'package:flutter/material.dart';
import 'package:yaha/entities/comments/comment.dart';

class CommentsScreenViewModel {
  final bool commentInputShown;
  final List<Comment> comments;
  final newCommentController = TextEditingController();

  CommentsScreenViewModel(
      {this.commentInputShown = false, this.comments = const []});

  dispose() {
    newCommentController.dispose();
  }
}
