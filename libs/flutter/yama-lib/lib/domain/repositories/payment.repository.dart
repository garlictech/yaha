abstract class PaymentRepository {
  Future<String?> reserve();
  Future<String?> release(String id);
  Future<String?> claim(String id);
}
