import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/controllers.dart';
import '../../controllers/map/utils/utils.dart';
import '../hikes/hike-card.dart';
import '../utils/utils.dart';
import 'controls/global_map_control.dart';
import 'hike_card_popup_state.dart';
import 'leaflet_map_widgets.dart';

class HikeSearchSesultsOnMap extends ConsumerStatefulWidget {
  const HikeSearchSesultsOnMap({super.key});

  @override
  HikeSearchSesultsOnMapState createState() => HikeSearchSesultsOnMapState();
}

class HikeSearchSesultsOnMapState
    extends ConsumerState<HikeSearchSesultsOnMap> {
  final popup = Consumer(builder: (c, ref, child) {
    final currentlyShownHikeId = ref.watch(hikeCardPopupStateProvider);
    const popupSize = 200.0;

    return currentlyShownHikeId != null
        ? Container(
            margin: const EdgeInsets.all(20),
            height: popupSize,
            width: popupSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 30,
                  blurRadius: 32,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              ],
            ),
            child: Stack(children: [
              HikeCard(hikeId: currentlyShownHikeId),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.close_rounded),
                      color: Colors.red,
                      onPressed: () => ref
                          .read(hikeCardPopupStateProvider.notifier)
                          .hideHike())),
            ]))
        : Container();
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(trackSearchControllerProvider);
    final globalMarkersState = ref.watch(globalMarkersProvider);
    final MapController mapController = MapController();

    if (searchState is AsyncLoading || globalMarkersState is AsyncLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final hits = searchState.asData?.value;
    final globalMarkers = globalMarkersState.asData?.value;

    if (hits == null || globalMarkers == null) {
      return errorWidget("Track search error", null);
    }

    final bounds = hits.bounds;

    return bounds != null
        ? Stack(children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                  initialCameraFit: CameraFit.bounds(bounds: bounds)),
              children: <Widget>[
                osmTileLayer,
                _getHikeLayerWidget(hits.tracks),
                _getMarkerLayerWidget(hits.tracks, globalMarkers),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: GlobalMapControl(
                    bounds: bounds, mapcontroller: mapController)),
            popup
          ])
        : const Center(child: Text("No hikes"));
  }

  _getHikeLayerWidget(List<TrackEntity> hikes) {
    final currentlyShownHikeId = ref.watch(hikeCardPopupStateProvider);
    final lines = hikes.map((hike) {
      final widthMultiplier = currentlyShownHikeId == hike.id ? 2.0 : 1.0;

      return Polyline(
          color: Color.fromRGBO(Random().nextInt(100) + 150, 0, 0, 1),
          strokeWidth: 4 * widthMultiplier,
          borderColor: Colors.blue,
          borderStrokeWidth: 1 * widthMultiplier,
          points: hike.route.coordinates
              .map<LatLng>((coord) =>
                  LatLng(coord.location.latitude, coord.location.longitude))
              .toList());
    }).toList();

    return PolylineLayer(polylines: lines);
  }

  _getMarkerLayerWidget(List<TrackEntity> hikes, List<Marker> globalMarkers) {
    const markerSize = 20.0;

    final markers = hikes
        .map((hike) {
          markerShape(Color color, ref) => InkWell(
              onTap: () {
                ref.read(hikeCardPopupStateProvider.notifier).showHike(hike.id);
              },
              child: Container(
                  decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  )
                ],
              )));

          final startMarker = Marker(
              height: markerSize,
              width: markerSize,
              point: LatLng(hike.route.coordinates.first.location.latitude,
                  hike.route.coordinates.first.location.longitude),
              child: markerShape(Colors.green, ref));
          final endMarker = Marker(
              height: markerSize,
              width: markerSize,
              point: LatLng(hike.route.coordinates.last.location.latitude,
                  hike.route.coordinates.last.location.longitude),
              child: markerShape(Colors.red, ref));
          return [startMarker, endMarker];
        })
        .expand((i) => i)
        .toList();
    return MarkerLayer(markers: [...markers, ...globalMarkers]);
  }
}
