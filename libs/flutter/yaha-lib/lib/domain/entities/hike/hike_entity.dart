import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/providers/game_rules_service_provider.dart';
import 'package:flutter_yaha_lib/providers/geocalc_service_provider.dart';
import 'package:latlong2/latlong.dart';

import '../../services/services.dart';
import '../../value_objects/value_objects.dart';
import '../image/image.dart';
import 'track_entity.dart';
import 'trail_entity.dart';

class HikeEntity {
  double? _trailLength;

  double? uphill_;

  double? downhill_;

  int? difficulty_;

  int? score_;

  String? mainImageUrl_;

  TrailEntity? trail_;

  LatLngBounds? bounds_;

  final TrackEntity track;

  final List<LatLng> distanceMarkers;
  late final GeocalcService geocalcService;
  late final GameRulesService gameRulesService;

  HikeEntity(
      {required this.track, required this.distanceMarkers, required Ref ref}) {
    geocalcService = ref.read(geocalcServiceProvider);

    gameRulesService = ref.read(gameRulesServiceProvider);
  }

  String get id {
    return track.id;
  }

  List<Description> get descriptions {
    return track.descriptions;
  }

  TrailEntity get trail => trail_ ??= TrailEntity(route: track.route);

  double get trailLength =>
      _trailLength ??= geocalcService.lineLength(trail.coordinatesAsPoints);

  double get uphill =>
      uphill_ ??= geocalcService.calculateUphill(trail.coordinatesAsPoints);

  double get downhill =>
      downhill_ ??= geocalcService.calculateDownhill(trail.coordinatesAsPoints);

  int get difficulty =>
      difficulty_ ??= gameRulesService.calculateDifficulty(trailLength, uphill);

  int get score =>
      score_ ??= gameRulesService.calculateScore(trailLength, uphill);

  GeoPoint get startPoint => trail.startPoint;

  GeoPoint get endPoint => trail.endPoint;

  String get title {
    const unknownTitle = 'Unknown Hike';
    return descriptions.isNotEmpty
        ? (descriptions.first.title ?? unknownTitle)
        : unknownTitle;
  }

  List<ImageEntity> get images {
    return trail.images;
  }

  List<String> get imageCardUrls {
    return trail.images.map((image) => image.card).toList();
  }

  String? get mainImageUrl {
    return mainImageUrl_ ??=
        images.isNotEmpty ? (images..shuffle).first.card : null;
  }

  LatLngBounds get bounds => bounds_ ??=
      geocalcService.getPaddedWaypointBounds(track.route.coordinates);

  removeImage(String imageUrl) {
    trail.images.removeWhere((element) => element.card == imageUrl);
  }
}
