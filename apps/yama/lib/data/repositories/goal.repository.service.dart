import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/data/auth/user_id.dart';
import 'package:yama_motivate/domain/repositories/goal.repository.dart';

import 'goal.repository.firebase.dart';

part 'goal.repository.service.g.dart';

@riverpod
class GoalRepositoryService extends _$GoalRepositoryService {
  @override
  GoalRepository? build() {
    final userId = ref.watch(userIdProvider);
    return userId == null ? null : GoalRepositoryFirebase(userId: userId);
    //return service.GoalRepositoryLocalStore();
  }
}
