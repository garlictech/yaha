import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/entities/shared/description.dart';
import 'package:yaha/domain/entities/shared/route.dart';
import 'package:yaha/utils/geometry/geocalc.dart';

import '../../game-rules.dart';
import '../image/image.dart';
import '../shared/point.dart';
import 'hike_entity.dart';

class Hike {
  double? _trailLength;

  double? uphill_;

  double? downhill_;

  int? difficulty_;

  int? score_;

  String? mainImageUrl_;

  Route? route_;

  final HikeEntity hike;

  final List<LatLng> distanceMarkers;

  Hike({required this.hike, required this.distanceMarkers});

  String get id {
    return hike.id;
  }

  List<Description> get descriptions {
    return hike.descriptions;
  }

  Route get route => route_ ??= Route(route: hike.route);

  double get trailLength =>
      _trailLength ??= GeoCalc.lineLength(route.coordinatesAsPoints);

  double get uphill =>
      uphill_ ??= GeoCalc.calculateUphill(route.coordinatesAsPoints);

  double get downhill =>
      downhill_ ??= GeoCalc.calculateDownhill(route.coordinatesAsPoints);

  int get difficulty =>
      difficulty_ ??= GameRules.calculateDifficulty(trailLength, uphill);

  int get score => score_ ??= GameRules.calculateScore(trailLength, uphill);

  Point get startPoint => route.startPoint;

  Point get endPoint => route.endPoint;

  String get title {
    const unknownTitle = 'Unknown Hike';
    return descriptions.isNotEmpty
        ? (descriptions.first.title ?? unknownTitle)
        : unknownTitle;
  }

  List<Image> get images {
    return route.images;
  }

  List<String> get imageCardUrls {
    return route.images.map((image) => image.card).toList();
  }

  String? get mainImageUrl {
    return mainImageUrl_ ??=
        images.isNotEmpty ? (images..shuffle).first.card : null;
  }

  removeImage(String imageUrl) {
    route.images.removeWhere((element) => element.card == imageUrl);
  }
}
