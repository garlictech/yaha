import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/hike_with_bounds.dart';
import 'package:flutter_yaha_lib/ui/views/map/global_markers.dart';
import 'package:flutter_yaha_lib/ui/views/map/controls/hike_map_control.dart';
import 'package:flutter_yaha_lib/ui/views/poi/poi-icon.dart';

import '../../../domain/entities/entities.dart';
import 'controls/global_map_control.dart';
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
    final hikeWithBounds = ref.watch(hikeWithBoundsProvider(widget.hikeId));
    final globalMarkers = ref.watch(globalMarkersProvider);

    if (hikeWithBounds == null) {
      return Container();
    }

    final hike = hikeWithBounds.value1;
    final bounds = hikeWithBounds.value2;

    return Stack(children: [
      FlutterMap(
        mapController: _mapController,
        options: MapOptions(
            initialCameraFit: CameraFit.bounds(
          bounds: bounds,
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
          child:
              GlobalMapControl(mapcontroller: _mapController, bounds: bounds)),
      Align(
          alignment: Alignment.bottomLeft,
          child: HikeMapControl(hikeId: widget.hikeId)),
      Align(
          alignment: Alignment.bottomLeft,
          child: HikeMapControl(hikeId: widget.hikeId)),
    ]);
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
