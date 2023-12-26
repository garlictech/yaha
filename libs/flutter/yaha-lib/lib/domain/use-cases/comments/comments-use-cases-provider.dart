import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/states/comments/comments-state.dart';

import 'comments-use-cases-neo4j.dart';
import 'comments-use-cases.dart';

final commentsUseCasesProvider = Provider<CommentsUseCases>((ref) {
  final commentsStateNotifier = ref.watch(commentsStateProvider.notifier);
  return CommentsUseCasesNeo4j(commentsStateNotifier: commentsStateNotifier);
});