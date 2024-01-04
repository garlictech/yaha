import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../screens/places_on_route_screen.dart';

part 'things_on_route_as_icons.controller.g.dart';

class ThingsOnRouteAsIconsState {
  final List<PoiOfHikeEntity> pois;
  final HikeEntity hike;

  ThingsOnRouteAsIconsState({
    required this.pois,
    required this.hike,
  });
}

@riverpod
class ThingsOnRouteAsIconsController extends _$ThingsOnRouteAsIconsController {
  @override
  FutureOr<ThingsOnRouteAsIconsState> build(String hikeId) async {
    final pois = await ref.watch(poisAlongHikeProvider(hikeId).future);
    final hike = await ref.watch(createConfiguredHikeProvider(hikeId).future);

    return ThingsOnRouteAsIconsState(pois: pois, hike: hike);
  }

  onPoiIconTapped(List<PoiType> types, BuildContext context) {
    ref
        .read(hikingSettingsServiceProvider(hikeId).notifier)
        .setFilteredPois(types);

    ref.read(createConfiguredHikeProvider(hikeId).future).then((hike) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlacesOnRouteScreen(
                    hike: hike,
                  )));
    });
  }

  get poiTypes => PoiUtils.uniqueTypes(state.value?.pois ?? []);

  HikeEntity get hike {
    final hike = state.value?.hike;

    if (hike == null) {
      throw Exception('Hike is null');
    }

    return hike;
  }
}
