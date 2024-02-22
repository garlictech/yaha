import 'package:functional_data/functional_data.dart';

part "payment_state.g.dart";

enum PaymentStatus { initial, loading, success, failure }

@FunctionalData()
class PaymentState extends $PaymentState {
  @override
  final PaymentStatus status;

  PaymentState({required this.status});
}
