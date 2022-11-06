import 'package:flutter/material.dart';

import '../../../domain/entities/comments/comment.dart';

class TimeCapsuleCommentsScreenViewModel {
  final bool commentInputShown;
  final List<Comment> comments;
  final newCommentController = TextEditingController();

  TimeCapsuleCommentsScreenViewModel(
      {this.commentInputShown = false, this.comments = const []});

  dispose() {
    newCommentController.dispose();
  }
}
