import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_of_hike_entity.dart';
import 'package:flutter_yaha_lib/domain/entities/poi/poi_type.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/configured_hike.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/hiking_settings_service.dart';
import 'package:flutter_yaha_lib/domain/use-cases/poi/pois_along_hike.dart';
import 'package:flutter_yaha_lib/domain/use-cases/poi/poi_utils.dart';
import 'package:flutter_yaha_lib/ui/views/screens/places_on_route_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  FutureOr<ThingsOnRouteAsIconsState> build(String hikeId) {
    final poisState = ref.watch(poisAlongHikeProvider(hikeId));
    final hikeState = ref.watch(configuredHikeProvider(hikeId));

    if (poisState.isLoading || hikeState.loading) {
      return future;
    }

    final pois = poisState.value;
    final hike = hikeState.data;

    if (pois == null || hike == null) {
      throw Exception('Pois or hike is null');
    }

    return ThingsOnRouteAsIconsState(pois: pois, hike: hike);
  }

  onPoiIconTapped(List<PoiType> types, BuildContext context) {
    ref
        .read(hikingSettingsServiceProvider(hikeId).notifier)
        .setFilteredPois(types);

    final hike = ref.read(configuredHikeProvider(hikeId)).data;

    if (hike == null) {
      throw Exception('Hike is null');
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlacesOnRouteScreen(
                  hike: hike,
                )));
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
