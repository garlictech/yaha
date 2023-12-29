import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_track_entity.g.dart';

@riverpod
class FetchTrackEntity extends _$FetchTrackEntity {
  @override
  Future<TrackEntity> build(String hikeId) {
    return ref.read(trackRepositoryProvider).getTrack(hikeId);
  }
}
