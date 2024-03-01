import 'package:yama_lib/domain/repositories/payment.repository.dart';

class PaymentRepositoryStripe extends PaymentRepository {
  @override
  reserve() async {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  release(String id) async {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<String?> claim(String id) async {
    return Future.delayed(const Duration(seconds: 3));
  }
}
