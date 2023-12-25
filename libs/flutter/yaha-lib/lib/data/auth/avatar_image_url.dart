import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/data/auth/auth_controller.dart';

part 'avatar_image_url.g.dart';

@riverpod
class AvatarImageUrl extends _$AvatarImageUrl {
  @override
  String? build() {
    final user = ref.watch(authControllerProvider);
    state = user?.photoURL;
    return state;
  }
}
