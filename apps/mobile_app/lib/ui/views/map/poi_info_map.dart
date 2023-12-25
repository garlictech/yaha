import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/use-cases/hike/hike_with_bounds.dart';
import 'package:yaha/ui/views/poi/poi-icon.dart';

import '../../../domain/entities/entities.dart';
import 'controls/global_map_control.dart';
import 'global_markers.dart';
import 'leaflet_map_widgets.dart';

class PoiInfoMap extends ConsumerStatefulWidget {
  final String hikeId;
  final Poi poi;

  const PoiInfoMap({Key? key, required this.hikeId, required this.poi})
      : super(key: key);

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
        options: MapOptions(bounds: bounds),
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
    ]);
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(Hike hike, List<Marker> globalMarkers) {
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
