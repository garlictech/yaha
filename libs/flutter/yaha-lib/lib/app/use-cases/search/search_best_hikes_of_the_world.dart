import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_best_hikes_of_the_world.g.dart';

@riverpod
class SearchBestHikesOfTheWorldUseCase
    extends _$SearchBestHikesOfTheWorldUseCase {
  @override
  FutureOr<void> build() {}

  Future<List<String>> execute() {
    final trackRepository = ref.read(trackRepositoryProvider);

    return trackRepository.getRandomTracks(10);
  }
}
