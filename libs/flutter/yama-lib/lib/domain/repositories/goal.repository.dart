import '../entities/goal.dart';

abstract class GoalRepository {
  Future<List<Goal>> addGoal(Goal goal);
  Future<List<Goal>> fetchGoals();
  Future<Goal> updateGoal(Goal goal);
  Future<void> deleteGoal(Goal goal);
  Future<void> archiveGoal(Goal goal);
}
