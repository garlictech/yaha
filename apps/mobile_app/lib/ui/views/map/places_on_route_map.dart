import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:yaha/domain/use-cases/hike/hike_with_bounds.dart';
import 'package:yaha/ui/views/map/controls/layers_control.dart';
import '../../../domain/entities/entities.dart';
import 'controls/layers_modal.dart';
import 'distance_markers.dart';
import 'controls/global_map_control.dart';
import 'global_markers.dart';
import 'controls/hike_map_control.dart';
import 'leaflet_map_widgets.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class PlacesOnRouteMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  final List<Poi> pois;
  final String hikeId;
  final double cardHeight;
  final double headerHeight = 105.0;

  const PlacesOnRouteMap(
      {Key? key,
      this.poiMarkerBuilder,
      this.pois = const [],
      required this.hikeId,
      required this.cardHeight})
      : super(key: key);

  @override
  PlacesOnRouteMapState createState() => PlacesOnRouteMapState();
}

class PlacesOnRouteMapState extends ConsumerState<PlacesOnRouteMap> {
  final MapController _mapController = MapController();
  bool _isLayerSelectorOn = false;
  bool _isMapOnly = false;
  TileLayer _mainTileLayer = osmTileLayer;
  final List<TileLayer> _optionalTilelayers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hikeWithBounds = ref.watch(hikeWithBoundsProvider(widget.hikeId));
    final globalMarkers = ref.watch(globalMarkersProvider);
    final distanceMarkers = ref.watch(distanceMarkersProvider(widget.hikeId));

    if (hikeWithBounds == null) {
      return Container();
    }
    final hike = hikeWithBounds.value1;
    final bounds = hikeWithBounds.value2;

    onLayersPressed() {
      setState(() {
        _isLayerSelectorOn = !_isLayerSelectorOn;
      });
    }

    onLayerSelected(TileLayer layerSelected) {
      setState(() {
        _mainTileLayer = layerSelected;
        _isLayerSelectorOn = false;
      });
    }

    onLayerAdded(TileLayer layer) {
      setState(() {
        if (_optionalTilelayers.contains(layer)) {
          _optionalTilelayers.remove(layer);
        } else {
          _optionalTilelayers.add(layer);
        }
        _isLayerSelectorOn = false;
      });
    }

    onMapOnlyPressed() {
      setState(() {
        _isMapOnly = !_isMapOnly;
      });
    }

    return Stack(children: [
      FlutterMap(
        mapController: _mapController,
        options: MapOptions(
            onTap: (_, __) {
              setState(() {
                _isLayerSelectorOn = false;
              });
            },
            bounds: bounds),
        children: <Widget>[
          _mainTileLayer,
          if (!_isMapOnly) _getHikeLayerWidget(hike),
          ..._optionalTilelayers,
          if (!_isMapOnly)
            _getMarkerLayerWidget([...globalMarkers, ...distanceMarkers]),
          if (!_isMapOnly) _getMarkerClusterLayerWidget(),
        ],
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: Container(
              margin: EdgeInsets.only(bottom: widget.cardHeight),
              child: GlobalMapControl(
                  mapcontroller: _mapController, originalBounds: bounds))),
      Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: EdgeInsets.only(top: widget.headerHeight),
              child: LayersControl(
                  onLayerPressed: onLayersPressed,
                  onMapOnlyPressed: onMapOnlyPressed,
                  isMapOnly: _isMapOnly))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              margin: EdgeInsets.only(bottom: widget.cardHeight),
              child: HikeMapControl(hikeId: widget.hikeId))),
      if (_isLayerSelectorOn)
        Align(
            alignment: Alignment.topRight,
            child: Container(
                margin:
                    EdgeInsets.only(top: widget.headerHeight + 55, right: 55.0),
                child: LayersModal(
                  currentlySelected: _mainTileLayer,
                  currentlyAdded: _optionalTilelayers,
                  onLayerSelected: onLayerSelected,
                  onLayerAdded: onLayerAdded,
                )))
    ]);
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(
        Polyline.new, [], {...trackBaseProps(hike), #strokeWidth: 10.0});
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(List<Marker> globalMarkers) {
    return MarkerLayer(
      markers: globalMarkers,
    );
  }

  _getMarkerClusterLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : widget.pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerClusterLayerWidget(
        options: MarkerClusterLayerOptions(
          markers: markers,
          maxClusterRadius: 45,
          size: const Size(40, 40),
          anchor: AnchorPos.align(AnchorAlign.center),
          fitBoundsOptions: const FitBoundsOptions(
            padding: EdgeInsets.all(50),
            maxZoom: 15,
          ),
          builder: (context, markers) {
            final bool isCurrentInCluster = markers.where((marker) {
              return marker.key.toString() == const Key("CURRENT").toString();
            }).isNotEmpty;

            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isCurrentInCluster
                      ? Colors.red
                      : Theme.of(context).primaryColor),
              child: Center(
                child: Text(
                  markers.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
