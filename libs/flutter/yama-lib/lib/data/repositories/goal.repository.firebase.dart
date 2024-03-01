import 'package:yama_lib/data/infrastructure/firebase_handler.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/repositories/goal.repository.dart';

class GoalRepositoryFirebase extends GoalRepository {
  final String userId;
  late final FirebaseDatabaseHandler _handler;

  GoalRepositoryFirebase({required this.userId}) {
    _handler = FirebaseDatabaseHandler(userId: userId);
  }

  @override
  addGoal(Goal goal) async {
    if (goal.id != null) {
      throw "Cannot add goal with defined id";
    }

    final currentGoals = await fetchGoals();
    currentGoals.add(goal);
    _handler.append(key: 'goals', data: goal.toJson());
    return currentGoals;
  }

  @override
  fetchGoals() async {
    final data = (await _handler.readList('goals'));
    return data.map((item) => Goal.fromJson(item)).toList();
  }

  @override
  updateGoal(Goal goal) async {
    if (goal.id == null) {
      throw "Cannot update goal without defined id";
    }

    final key = 'goals/${goal.id}';
    final data = goal.toJson();
    data.remove('id');

    await _handler.update(key: key, data: data);
    return goal;
  }

  @override
  deleteGoal(Goal goal) async {
    final key = 'goals/${goal.id}';
    await _handler.delete(key: key);
  }

  @override
  archiveGoal(Goal goal) async {
    final newGoal = goal.copyWith(status: GoalStatus.achieved);
    await updateGoal(newGoal);
  }
}
