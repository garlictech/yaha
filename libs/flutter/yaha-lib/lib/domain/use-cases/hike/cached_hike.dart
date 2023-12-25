import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/app/providers.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';

part 'cached_hike.g.dart';

@riverpod
class CachedHike extends _$CachedHike {
  @override
  Future<HikeEntity> build(String hikeId) {
    return ref.read(hikeRepositoryProvider).getHike(hikeId);
  }
}
