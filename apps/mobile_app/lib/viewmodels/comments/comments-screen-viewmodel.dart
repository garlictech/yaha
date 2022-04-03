import 'package:flutter/material.dart';
import 'package:yaha/domain/domain.dart';

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
