import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:functional_data/functional_data.dart';

part 'track_search_results.g.dart';

@FunctionalData()
class TrackSearchResults extends $TrackSearchResults {
  @override
  final List<TrackEntity> tracks;
  @override
  final LatLngBounds? bounds;

  TrackSearchResults({required this.tracks, this.bounds});
}
