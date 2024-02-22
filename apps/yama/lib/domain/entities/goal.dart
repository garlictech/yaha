import 'dart:math';

import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

enum GoalStatus { ongoing, achieved, failed, toBeDecided }

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class Goal extends $Goal {
  static const zeroDur = Duration(days: 0);

  @override
  final String? id;
  @override
  final String text;
  @override
  final DateTime start;
  @override
  final GoalStatus status;
  @override
  final String paymentId;
  @override
  late final List<String> dailyCheckinStatus;

  Goal(
      {required this.paymentId,
      required this.text,
      required this.start,
      required this.status,
      List<String>? dailyCheckinStatus,
      this.id}) {
    this.dailyCheckinStatus = dailyCheckinStatus ?? List.filled(6, "waiting");
  }

  get ratioTowardFinish {
    final now = DateTime.now();
    final fromStartToNow = now.difference(start).inMinutes;
    final fromStartToDeadline = deadline.difference(start).inMinutes;

    return now.isAfter(deadline) ? 1.0 : fromStartToNow / fromStartToDeadline;
  }

  get timeUntilDeadline => deadline.difference(DateTime.now());
  get deadline => start.add(const Duration(days: 6));
  get hoursRemaining => timeUntilDeadline.inHours;
  get secondsRemaining => timeUntilDeadline.inSeconds;
  get secondsPassed => DateTime.now().difference(start).inSeconds;
  get daysRemaining => timeUntilDeadline.inDays;
  get secondsUntilDeciding => max(
      0,
      deadline.add(const Duration(days: 1)).difference(DateTime.now()).inSeconds
          as int);
  get decingDeadline => deadline.add(const Duration(days: 1));

  get remainingTimeLabel {
    final tud = timeUntilDeadline;

    if (tud < const Duration(days: 1) && tud >= zeroDur) {
      return "today";
    } else if (tud < zeroDur) {
      return "over deadline";
    }

    return '${tud.inDays + 1} day(s)';
  }

  get isOverDeadline {
    return DateTime.now().isAfter(deadline);
  }

  get isDecidingTime {
    return status == GoalStatus.ongoing &&
        secondsUntilDeciding > 0 &&
        isOverDeadline;
  }

  get isFailed {
    final isOverDecidingDeadline = DateTime.now().isAfter(decingDeadline);

    return status == GoalStatus.failed || isOverDecidingDeadline;
  }

  get isAchieved {
    return status == GoalStatus.achieved;
  }

  get isOngoing {
    return status == GoalStatus.ongoing && DateTime.now().isBefore(deadline);
  }

  get canCheckinDaily {
    final now = DateTime.now();
    return status == GoalStatus.ongoing &&
        now.isBefore(deadline) &&
        now.isAfter(start.add(const Duration(days: 1)));
  }

  get allowedMaxCheckinDays {
    final now = DateTime.now();
    final diff = now.difference(start).inDays;
    return diff > 5 ? 5 : diff - 1;
  }

  get progressColor {
    if (ratioTowardFinish > 0.8) {
      return Colors.red;
    } else if (ratioTowardFinish > 0.6) {
      return Colors.orange;
    }

    return Colors.green;
  }

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
