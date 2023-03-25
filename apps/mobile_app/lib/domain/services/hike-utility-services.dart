import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/app/calculation-providers.dart';
import 'package:yaha/domain/use-cases/hike/cached_hike.dart';

import '../entities/entities.dart';

class HikeUtilityServices {
  final Ref ref;

  HikeUtilityServices({required this.ref});

  Future<List<Hike>> getHikes(List<String> hikeIds) {
    FutureGroup<Hike?> group = FutureGroup<Hike?>();

    for (var id in hikeIds) {
      final hike = ref.read(cachedHikeProvider(id).future);
      group.add(hike);
    }

    group.close();
    return group.future.then((hikes) => hikes.whereType<Hike>().toList());
  }

  Stream<Hike> getHikesAsStream(List<String> hikeIds) {
    return Stream<Hike?>.fromFutures(hikeIds.map((id) {
      final x = ref.read(cachedHikeProvider(id).future);
      return x;
    }).toList())
        .whereType<Hike>();
  }

  Stream<List<Hike>> getHikesListAsStream(List<String> hikeIds) {
    final streams = hikeIds
        .map((id) =>
            Stream<Hike?>.fromFuture(ref.read(cachedHikeProvider(id).future))
                .startWith(null))
        .toList();

    final combinedStream = CombineLatestStream.list<Hike?>(streams)
        .map((hikes) => hikes.whereType<Hike>().toList());

    return combinedStream;
  }

  Stream<Tuple2<List<Hike>, LatLngBounds>> getHikeListStreamWithBounds(
      List<String> hikeIds,
      {num boundingRation = 0.1}) {
    final geocalc = ref.read(geoCalcProvider);

    return getHikesListAsStream(hikeIds).flatMap((event) => Stream.fromFuture(
            geocalc
                .boundingBoxOfPaths(
                    event.map((hike) => hike.route.asLineString).toList())
                .then((boundingBox) {
          final xPad =
              (boundingBox.NorthEast.lat - boundingBox.SouthWest.lat).abs() *
                  boundingRation;
          final yPad =
              (boundingBox.NorthEast.lon - boundingBox.SouthWest.lon).abs() *
                  boundingRation;

          return LatLngBounds(
              LatLng(boundingBox.SouthWest.lat - xPad,
                  boundingBox.SouthWest.lon + yPad),
              LatLng(boundingBox.NorthEast.lat + xPad,
                  boundingBox.NorthEast.lon - yPad));
        })).map((bounds) => Tuple2(event, bounds)));
  }
}

final hikeUtilityServicesProvider =
    Provider<HikeUtilityServices>((ref) => HikeUtilityServices(ref: ref));
