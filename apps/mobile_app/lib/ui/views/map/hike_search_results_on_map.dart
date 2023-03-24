import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';
import 'package:yaha/domain/services/services.dart';
import 'package:yaha/ui/views/hikes/hike-card.dart';
import '../../../app/providers.dart';

import '../../../domain/entities/entities.dart';
import '../../presenters/map/map.dart';
import 'hike_card_popup_state.dart';

class HikeSearchSesultsOnMap extends ConsumerStatefulWidget {
  final List<String> hikeIds;

  const HikeSearchSesultsOnMap({Key? key, required this.hikeIds})
      : super(key: key);

  @override
  HikeSearchSesultsOnMapState createState() => HikeSearchSesultsOnMapState();
}

class HikeSearchSesultsOnMapState
    extends ConsumerState<HikeSearchSesultsOnMap> {
  MapController? _mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = ref.watch(leafletMapMVPProvider.notifier);
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    final hikesWithBounds =
        hikeUtilityServices.getHikeListStreamWithBounds(widget.hikeIds);

    ref
        .read(geoLocationRepositoryProvider)
        .getCurrentLocation()
        .then((currentLocation) {
      presenter.mapCenter = Location(
          lat: currentLocation.latitude, lon: currentLocation.longitude);
    });

    final popup = Consumer(builder: (c, ref, child) {
      final currentlyShownHikeId = ref.watch(hikeCardPopupStateProvider);
      const popupSize = 200.0;

      return currentlyShownHikeId != null
          ? Stack(children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  height: popupSize,
                  width: popupSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      )
                    ],
                  ),
                  child: HikeCard(hikeId: currentlyShownHikeId))
            ])
          : Container();
    });

    return StreamBuilder(
        stream: hikesWithBounds,
        builder: (context,
            AsyncSnapshot<Tuple2<List<Hike>, LatLngBounds>> snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }

          final hikes = snapshot.data!.value1;
          final bounds = snapshot.data!.value2;

          return Stack(children: [
            FlutterMap(
              options: MapOptions(
                  /*center: LatLng(
                      mapCenter?.latitude ?? 0, mapCenter?.longitude ?? 0),
                      */
                  bounds: bounds,
                  zoom: _mapController?.zoom ?? 12),
              children: <Widget>[
                TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                _getHikeLayerWidget(hikes),
                _getMarkerLayerWidget(hikes),
              ],
            ),
            popup
          ]);
        });
  }

  _getHikeLayerWidget(List<Hike> hikes) {
    final lines = hikes.map((hike) {
      return Polyline(
          color: const Color(0xAAFF0000),
          strokeWidth: 4,
          borderColor: Colors.blue,
          borderStrokeWidth: 1,
          points: hike.route.coordinates
              .map<LatLng>((coord) =>
                  LatLng(coord.location.latitude, coord.location.longitude))
              .toList());
    }).toList();

    return PolylineLayer(polylines: lines);
  }

  _getMarkerLayerWidget(List<Hike> hikes) {
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
              point:
                  LatLng(hike.startPoint.latitude, hike.startPoint.longitude),
              builder: (c) {
                return markerShape(Colors.green, ref);
              });
          final endMarker = Marker(
              height: markerSize,
              width: markerSize,
              point: LatLng(hike.endPoint.latitude, hike.endPoint.longitude),
              builder: (c) {
                return markerShape(Colors.red, ref);
              });
          return [startMarker, endMarker];
        })
        .expand((i) => i)
        .toList();
    return MarkerLayer(markers: markers);
  }
}
