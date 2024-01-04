import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:latlong2/latlong.dart';

import '../../../domain/entities/entities.dart';
import '../../controllers/map/utils/parameters.dart';
import '../../controllers/map/utils/utils.dart';
import '../poi/poi.dart';
import '../utils/utils.dart';
import 'controls/global_map_control.dart';
import 'leaflet_map_widgets.dart';

class PoiInfoMap extends ConsumerStatefulWidget {
  final String hikeId;
  final PoiEntity poi;

  const PoiInfoMap({super.key, required this.hikeId, required this.poi});

  @override
  PoiInfoMapState createState() => PoiInfoMapState();
}

class PoiInfoMapState extends ConsumerState<PoiInfoMap> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trackState = ref.watch(createConfiguredHikeProvider(widget.hikeId));
    final globalMarkersState = ref.watch(globalMarkersProvider);

    if (trackState is AsyncError || globalMarkersState is AsyncError) {
      return errorWidget(trackState.error, null);
    }

    final hike = trackState.asData?.value;
    final globalMarkers = globalMarkersState.asData?.value;

    if (hike == null || globalMarkers == null) {
      return errorWidget("Hike not found", null);
    }

    final bounds = hike.bounds;

    return Stack(children: [
      FlutterMap(
        mapController: _mapController,
        options: MapOptions(initialCameraFit: CameraFit.bounds(bounds: bounds)),
        children: <Widget>[
          osmTileLayer,
          _getHikeLayerWidget(hike),
          _getMarkerLayerWidget(hike, globalMarkers),
        ],
      ),
      Align(
          alignment: Alignment.bottomRight,
          child:
              GlobalMapControl(mapcontroller: _mapController, bounds: bounds)),
    ]);
  }

  _getHikeLayerWidget(HikeEntity hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(HikeEntity hike, List<Marker> globalMarkers) {
    const markerSize = roundMarkerSize;

    final marker = Marker(
        point:
            LatLng(widget.poi.geoPoint.latitude, widget.poi.geoPoint.longitude),
        child: SizedBox(
            height: markerSize,
            width: markerSize,
            child: PhysicalModel(
                color: Colors.black,
                shadowColor: Colors.black,
                elevation: 8.0,
                shape: BoxShape.circle,
                child: PoiIcon(poiType: widget.poi.poiType))));
    return MarkerLayer(markers: [marker, ...globalMarkers]);
  }
}
