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
      List<String> hikeIds) {
    return getHikesListAsStream(hikeIds).map((hikes) {
      final bounds = LatLngBounds();
      hikes.map((hike) => hike.route.coordinates).expand((i) => i).forEach(
          (point) => bounds.extend(
              LatLng(point.location.latitude, point.location.longitude)));
      bounds.pad(0.2);
      return Tuple2(hikes, bounds);
    });
  }
}

final hikeUtilityServicesProvider =
    Provider<HikeUtilityServices>((ref) => HikeUtilityServices(ref: ref));
