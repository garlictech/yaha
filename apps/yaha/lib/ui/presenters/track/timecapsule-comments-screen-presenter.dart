import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/viewmodels/track/timecapsule-comments-screen-viewmodel.dart';
import 'package:yaha/domain/states/comments/comments-state.dart';
import 'package:yaha/domain/use-cases/comments/comments-use-cases-provider.dart';

import '../../../domain/entities/comments/comment.dart';

class TimeCapsuleCommentsScreenPresenter
    extends StateNotifier<TimeCapsuleCommentsScreenViewModel> {
  final ProviderReference ref;

  TimeCapsuleCommentsScreenPresenter(
      {required this.ref, required List<Comment> comments})
      : super(TimeCapsuleCommentsScreenViewModel(comments: comments));

  toggleCommentInput() => state = new TimeCapsuleCommentsScreenViewModel(
      commentInputShown: !state.commentInputShown);

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

final timeCapsuleCommentsScreenMVPProvider = StateNotifierProvider<
    TimeCapsuleCommentsScreenPresenter,
    TimeCapsuleCommentsScreenViewModel>((ref) {
  final commentsState = ref.watch(commentsStateProvider);
  return TimeCapsuleCommentsScreenPresenter(
      ref: ref, comments: commentsState.comments);
});
