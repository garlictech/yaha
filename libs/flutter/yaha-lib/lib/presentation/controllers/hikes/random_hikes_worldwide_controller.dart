import 'package:flutter_yaha_lib/app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_hikes_worldwide_controller.g.dart';

@riverpod
class RandomHikesWorldwideController extends _$RandomHikesWorldwideController {
  @override
  FutureOr<List<String>> build() async {
    return await _refresh();
  }

  refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _refresh());
  }

  Future<List<String>> _refresh() {
    return ref
        .read(searchBestHikesOfTheWorldUseCaseProvider.notifier)
        .execute();
  }
}
