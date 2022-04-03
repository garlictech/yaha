import 'package:yaha/states/comments/comments-state.dart';

import '../../entities/entities.dart';
import 'comments-use-cases.dart';

class CommentsUseCasesNeo4j extends CommentsUseCases {
  final CommentsStateNotifier commentsStateNotifier;

  CommentsUseCasesNeo4j({required this.commentsStateNotifier});

  @override
  addNewComment({body = String}) {
    commentsStateNotifier.addComment(Comment(
        body: body,
        ownerId: "ownerId",
        ownerName: "John Doe",
        profilePicture: 'https://i.pravatar.cc/50',
        date: DateTime.now().toString()));
  }
}
