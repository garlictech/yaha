import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  User? build() {
    FirebaseAuth.instance.userChanges().listen((user) {
      state = user;
    });
    return null;
  }
}
