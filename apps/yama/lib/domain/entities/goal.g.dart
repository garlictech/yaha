// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Goal {
  const $Goal();

  String? get id;
  String get text;
  DateTime get start;
  GoalStatus get status;
  String get paymentId;
  List<String> get dailyCheckinStatus;

  Goal copyWith({
    String? id,
    String? text,
    DateTime? start,
    GoalStatus? status,
    String? paymentId,
    List<String>? dailyCheckinStatus,
  }) =>
      Goal(
        id: id ?? this.id,
        text: text ?? this.text,
        start: start ?? this.start,
        status: status ?? this.status,
        paymentId: paymentId ?? this.paymentId,
        dailyCheckinStatus: dailyCheckinStatus ?? this.dailyCheckinStatus,
      );

  Goal copyUsing(void Function(Goal$Change change) mutator) {
    final change = Goal$Change._(
      this.id,
      this.text,
      this.start,
      this.status,
      this.paymentId,
      this.dailyCheckinStatus,
    );
    mutator(change);
    return Goal(
      id: change.id,
      text: change.text,
      start: change.start,
      status: change.status,
      paymentId: change.paymentId,
      dailyCheckinStatus: change.dailyCheckinStatus,
    );
  }

  @override
  String toString() =>
      "Goal(id: $id, text: $text, start: $start, status: $status, paymentId: $paymentId, dailyCheckinStatus: $dailyCheckinStatus)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Goal &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      text == other.text &&
      start == other.start &&
      status == other.status &&
      paymentId == other.paymentId &&
      dailyCheckinStatus == other.dailyCheckinStatus;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + text.hashCode;
    result = 37 * result + start.hashCode;
    result = 37 * result + status.hashCode;
    result = 37 * result + paymentId.hashCode;
    result = 37 * result + dailyCheckinStatus.hashCode;
    return result;
  }
}

class Goal$Change {
  Goal$Change._(
    this.id,
    this.text,
    this.start,
    this.status,
    this.paymentId,
    this.dailyCheckinStatus,
  );

  String? id;
  String text;
  DateTime start;
  GoalStatus status;
  String paymentId;
  List<String> dailyCheckinStatus;
}

// ignore: avoid_classes_with_only_static_members
class Goal$ {
  static final id = Lens<Goal, String?>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final text = Lens<Goal, String>(
    (textContainer) => textContainer.text,
    (textContainer, text) => textContainer.copyWith(text: text),
  );

  static final start = Lens<Goal, DateTime>(
    (startContainer) => startContainer.start,
    (startContainer, start) => startContainer.copyWith(start: start),
  );

  static final status = Lens<Goal, GoalStatus>(
    (statusContainer) => statusContainer.status,
    (statusContainer, status) => statusContainer.copyWith(status: status),
  );

  static final paymentId = Lens<Goal, String>(
    (paymentIdContainer) => paymentIdContainer.paymentId,
    (paymentIdContainer, paymentId) =>
        paymentIdContainer.copyWith(paymentId: paymentId),
  );

  static final dailyCheckinStatus = Lens<Goal, List<String>>(
    (dailyCheckinStatusContainer) =>
        dailyCheckinStatusContainer.dailyCheckinStatus,
    (dailyCheckinStatusContainer, dailyCheckinStatus) =>
        dailyCheckinStatusContainer.copyWith(
            dailyCheckinStatus: dailyCheckinStatus),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) => Goal(
      paymentId: json['paymentId'] as String,
      text: json['text'] as String,
      start: DateTime.parse(json['start'] as String),
      status: $enumDecode(_$GoalStatusEnumMap, json['status']),
      dailyCheckinStatus: (json['dailyCheckinStatus'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$GoalToJson(Goal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['text'] = instance.text;
  val['start'] = instance.start.toIso8601String();
  val['status'] = _$GoalStatusEnumMap[instance.status]!;
  val['paymentId'] = instance.paymentId;
  val['dailyCheckinStatus'] = instance.dailyCheckinStatus;
  return val;
}

const _$GoalStatusEnumMap = {
  GoalStatus.ongoing: 'ongoing',
  GoalStatus.achieved: 'achieved',
  GoalStatus.failed: 'failed',
  GoalStatus.toBeDecided: 'toBeDecided',
};
