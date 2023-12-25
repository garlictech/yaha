import 'package:functional_data/functional_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/entities/entities.dart';

part 'comments-state.g.dart';

@FunctionalData()
class CommentsState extends $CommentsState {
  @override
  final List<Comment> comments;

  CommentsState({this.comments = const []});
}

class CommentsStateNotifier extends StateNotifier<CommentsState> {
  CommentsStateNotifier(List<Comment> initialComments)
      : super(CommentsState(comments: initialComments));

  addComment(Comment newComment) {
    return state = state.copyWith(comments: [...state.comments, newComment]);
  }
}

final commentsStateProvider =
    StateNotifierProvider<CommentsStateNotifier, CommentsState>((ref) {
  return CommentsStateNotifier([
    Comment(
        ownerName: "John Doe",
        profilePicture: 'https://i.pravatar.cc/50',
        date: DateTime.now().toString(),
        body: "The best hike ever",
        ownerId: "owner1"),
    Comment(
        body: "And placed a time capsule.",
        ownerId: "owner2",
        ownerName: "Brian Doe",
        profilePicture: 'https://i.pravatar.cc/50',
        date: DateTime.now().toString())
  ]);
});
