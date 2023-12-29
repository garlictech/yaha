import 'package:flutter_yaha_lib/domain/domain.dart';

abstract class TrackRepository {
  Future<List<String>> getTrackList();
  Future<TrackEntity> getTrack(String id);
  Future<List<String>> searchTrackByRadius(SearchByRadiusInput input);
  Future<List<String>> searchTrackByContent(SearchByContentInput content);
  Future<List<String>> getRandomTracks(int limit);
  Future<List<PoiEntity>> getOnroutePois(String id);
  Future<List<PoiEntity>> getOffroutePois(String id);
}
