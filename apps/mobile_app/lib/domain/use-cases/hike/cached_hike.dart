import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/entities/hike/hike_entity.dart';

part 'cached_hike.g.dart';

@riverpod
class CachedHike extends _$CachedHike {
  @override
  Future<HikeEntity> build(String hikeId) {
    return ref.read(hikeRepositoryProvider).getHike(hikeId);
  }
}
