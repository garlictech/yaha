import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../controllers/map/map.dart';
import '../poi/poi.dart';
import '../utils/error-utils.dart';
import 'controls/global_map_control.dart';
import 'controls/hike_map_control.dart';
import 'leaflet_map_widgets.dart';

class HikeOverviewMap extends ConsumerStatefulWidget {
  final String hikeId;

  const HikeOverviewMap({super.key, required this.hikeId});

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
    final hike = ref.watch(createConfiguredHikeProvider(widget.hikeId));
    final globalMarkers = ref.watch(globalMarkersProvider);

    return hike.when(
        data: (hike) {
          return Stack(children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                  initialCameraFit: CameraFit.bounds(
                bounds: hike.bounds,
                padding: const EdgeInsets.all(20),
              )),
              children: <Widget>[
                osmTileLayer,
                _getHikeLayerWidget(hike),
                _getMarkerLayerWidget(hike, globalMarkers ?? []),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: GlobalMapControl(
                    mapcontroller: _mapController, bounds: hike.bounds)),
            Align(
                alignment: Alignment.bottomLeft,
                child: HikeMapControl(hikeId: widget.hikeId)),
            Align(
                alignment: Alignment.bottomLeft,
                child: HikeMapControl(hikeId: widget.hikeId)),
          ]);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => errorWidget(error, stack));
  }

  _getHikeLayerWidget(HikeEntity hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(HikeEntity hike, List<Marker> globalMarkers) {
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
        child: markerShape(
            const PoiIcon(
                poiType: PoiType(category: "yaha", kind: "start_hike")),
            ref));
    final endMarker = Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(hike.endPoint.latitude, hike.endPoint.longitude),
        child: markerShape(
            const PoiIcon(
                poiType: PoiType(category: "yaha", kind: "finish_hike")),
            ref));

    return MarkerLayer(markers: [startMarker, endMarker, ...globalMarkers]);
  }
}
