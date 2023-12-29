import 'package:functional_data/functional_data.dart';

import 'geo_point.dart';

part 'track_search_filters.g.dart';

@FunctionalData()
class TrackSearchFilters extends $TrackSearchFilters {
  @override
  final double lengthMin;
  @override
  final double lengthMax;
  @override
  final double durationMin;
  @override
  final double durationMax;
  @override
  final int searchRadius;
  @override
  final int difficulty;
  @override
  final int difficultyIndex;
  @override
  final GeoPoint origin;
  @override
  final List<String> hits;
  @override
  final bool searching;
  @override
  final bool noHits;

  TrackSearchFilters(
      {this.lengthMin = 3.0,
      this.lengthMax = 10.0,
      this.durationMin = 8.0,
      this.durationMax = 10.0,
      this.searchRadius = 50000,
      this.difficulty = 1,
      this.difficultyIndex = 0,
      this.hits = const [],
      this.searching = false,
      this.noHits = false,
      this.origin = const GeoPoint(latitude: 0, longitude: 0, height: 0)});
}
