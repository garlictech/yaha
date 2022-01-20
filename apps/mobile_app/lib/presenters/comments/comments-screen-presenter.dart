import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/entities/comments/comment.dart';
import 'package:yaha/states/comments/comments-state.dart';
import 'package:yaha/use-cases/comments/comments-use-cases-provider.dart';
import 'package:yaha/viewmodels/comments/comments-screen-viewmodel.dart';

class CommentsScreenPresenter extends StateNotifier<CommentsScreenViewModel> {
  final ProviderReference ref;

  CommentsScreenPresenter({required this.ref, required List<Comment> comments})
      : super(CommentsScreenViewModel(comments: comments));

  toggleCommentInput() => state =
      new CommentsScreenViewModel(commentInputShown: !state.commentInputShown);

  sendComment({body: String}) {
    final commentsUseCases = ref.read(commentsUseCasesProvider);
    commentsUseCases.addNewComment(body: body);
    toggleCommentInput();
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}

final commentsScreenMVPProvider =
    StateNotifierProvider<CommentsScreenPresenter, CommentsScreenViewModel>(
        (ref) {
  final commentsState = ref.watch(commentsStateProvider);
  return CommentsScreenPresenter(ref: ref, comments: commentsState.comments);
});
