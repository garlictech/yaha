import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/services/services.dart';
import 'package:yaha/ui/views/map/global_markers.dart';
import 'package:yaha/ui/views/poi/poi-icon.dart';

import '../../../domain/entities/entities.dart';
import 'global_map_control.dart';
import 'leaflet_map_widgets.dart';

class HikeOverviewMap extends ConsumerStatefulWidget {
  final String hikeId;

  const HikeOverviewMap({Key? key, required this.hikeId}) : super(key: key);

  @override
  HikeOverviewMapState createState() => HikeOverviewMapState();
}

class HikeOverviewMapState extends ConsumerState<HikeOverviewMap> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    final hikeWithBounds =
        hikeUtilityServices.getHikeListStreamWithBounds([widget.hikeId]);
    final globalMarkers = ref.watch(globalMarkersProvider);

    return StreamBuilder(
        stream: hikeWithBounds,
        builder: (context,
            AsyncSnapshot<Tuple2<List<Hike>, LatLngBounds>> snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }

          final hike = snapshot.data!.value1[0];
          final bounds = snapshot.data!.value2;

          return Stack(children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(bounds: bounds),
              children: <Widget>[
                yahaTileLayer,
                _getHikeLayerWidget(hike),
                _getMarkerLayerWidget(hike, globalMarkers),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: GlobalMapControl(
                    mapcontroller: _mapController, originalBounds: bounds)),
          ]);
        });
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(Hike hike, List<Marker> globalMarkers) {
    const markerSize = roundMarkerSize;

    markerShape(PoiIcon icon, ref) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        child: icon);

    final startMarker = Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(hike.startPoint.latitude, hike.startPoint.longitude),
        builder: (c) {
          return markerShape(
              const PoiIcon(
                  poiType: PoiType(category: "yaha", kind: "start_hike")),
              ref);
        });
    final endMarker = Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(hike.endPoint.latitude, hike.endPoint.longitude),
        builder: (c) {
          return markerShape(
              const PoiIcon(
                  poiType: PoiType(category: "yaha", kind: "finish_hike")),
              ref);
        });

    return MarkerLayer(markers: [startMarker, endMarker, ...globalMarkers]);
  }
}
