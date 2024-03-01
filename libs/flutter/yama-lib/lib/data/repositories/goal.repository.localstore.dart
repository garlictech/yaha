import 'dart:convert';
import 'package:yama_lib/data/infrastructure/localstore_handler.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/repositories/goal.repository.dart';

class GoalRepositoryLocalStore extends GoalRepository {
  static const key = "GOALS";
  final _localStoreHandler = LocalStoreHandler();

  @override
  addGoal(Goal goal) async {
    final currentGoals = await fetchGoals();
    currentGoals.add(goal);
    final elements = currentGoals.map((goal) => goal.toJson()).toList();
    final data = jsonEncode({'data': elements});
    await _localStoreHandler.setItem(key, data);
    return currentGoals;
  }

  @override
  fetchGoals() async {
    final dataStr = await _localStoreHandler.getItem(key);

    /*if (dataStr == null) {
      return [];
    }

    final List data = jsonDecode(jsonDecode(dataStr))['data'];
    final goals = data.map((item) => Goal.fromJson(item)).toList();*/

    final goals = [
      Goal(
          text: "Gave good time",
          start: DateTime.parse("20230504"),
          deadline: DateTime.parse("2023-05-06"),
          reservedAmount: 123,
          currency: "EUR",
          status: GoalStatus.ongoing),
      Goal(
          text: "Have a healthy breakfast",
          start: DateTime.parse("20230501"),
          deadline: DateTime.parse("2023-05-31"),
          reservedAmount: 123,
          currency: "EUR",
          status: GoalStatus.ongoing),
      Goal(
          text: "Every hour take a bottle of water",
          start: DateTime.parse("20230506"),
          deadline: DateTime.parse("2023-05-10"),
          reservedAmount: 2,
          currency: "\$",
          status: GoalStatus.ongoing),
      Goal(
          text: "Do something good every day",
          start: DateTime.parse("20230506"),
          deadline: DateTime.parse("2023-05-08"),
          reservedAmount: 2,
          currency: "\$",
          status: GoalStatus.ongoing),
      Goal(
          text: "Fitness each day",
          start: DateTime.parse("20230504"),
          deadline: DateTime.parse("2023-05-05"),
          reservedAmount: 132,
          currency: "EUR",
          status: GoalStatus.completed),
      Goal(
          text:
              "A really long goal with blabla. A really long goal with blabla. A really long goal with blabla. A really long goal with blabla. A really long goal with blabla. ",
          start: DateTime.parse("20230503"),
          deadline: DateTime.parse("2023-05-04"),
          reservedAmount: 12,
          currency: "EUR",
          status: GoalStatus.failed)
    ];

    return goals;
  }
}
