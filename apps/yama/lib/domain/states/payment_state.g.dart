// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PaymentState {
  const $PaymentState();

  PaymentStatus get status;

  PaymentState copyWith({
    PaymentStatus? status,
  }) =>
      PaymentState(
        status: status ?? this.status,
      );

  PaymentState copyUsing(void Function(PaymentState$Change change) mutator) {
    final change = PaymentState$Change._(
      this.status,
    );
    mutator(change);
    return PaymentState(
      status: change.status,
    );
  }

  @override
  String toString() => "PaymentState(status: $status)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PaymentState &&
      other.runtimeType == runtimeType &&
      status == other.status;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return status.hashCode;
  }
}

class PaymentState$Change {
  PaymentState$Change._(
    this.status,
  );

  PaymentStatus status;
}

// ignore: avoid_classes_with_only_static_members
class PaymentState$ {
  static final status = Lens<PaymentState, PaymentStatus>(
    (statusContainer) => statusContainer.status,
    (statusContainer, status) => statusContainer.copyWith(status: status),
  );
}
