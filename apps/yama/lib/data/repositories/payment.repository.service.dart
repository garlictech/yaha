import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/data/repositories/payment.repository.stripe.dart';
import '../../domain/repositories/payment.repository.dart';

part 'payment.repository.service.g.dart';

@riverpod
class PaymentRepositoryService extends _$PaymentRepositoryService {
  @override
  PaymentRepository build() {
    return PaymentRepositoryStripe();
  }
}
