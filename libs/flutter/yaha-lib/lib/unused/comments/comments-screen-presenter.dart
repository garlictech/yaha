import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/viewmodels/comments/comments-screen-viewmodel.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/states/comments/comments-state.dart';

class CommentsScreenPresenter extends StateNotifier<CommentsScreenViewModel> {
  final Ref ref;

  CommentsScreenPresenter({required this.ref, required List<Comment> comments})
      : super(CommentsScreenViewModel(comments: comments));

  toggleCommentInput() => state =
      CommentsScreenViewModel(commentInputShown: !state.commentInputShown);

  sendComment({body = String}) {
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
