import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/presentation/widgets/utils/error-utils.dart';
import 'package:latlong2/latlong.dart';
import '../../controllers/map/map.dart';
import '../poi/poi.dart';
import 'buttons/poi_filter_button.dart';
import 'controls/layers_control.dart';
import 'controls/layers_modal.dart';
import 'controls/poi_popup.dart';
import 'controls/global_map_control.dart';
import 'controls/hike_map_control.dart';
import 'controls/poi_selector_modal.dart';
import 'leaflet_map_widgets.dart';

typedef OnroutePoiMarkerBuilder = Marker Function(
    BuildContext context, PoiEntity poi, int poiIndex);

typedef OffroutePoiMarkerBuilder = Marker Function(
    BuildContext context, PoiEntity poi);

class PlacesOnRouteMap extends ConsumerStatefulWidget {
  final OnroutePoiMarkerBuilder? onroutePoiMarkerBuilder;
  final List<PoiEntity> onroutePois;
  final String hikeId;
  final double cardHeight;
  final double headerHeight = 105.0;

  const PlacesOnRouteMap(
      {super.key,
      this.onroutePoiMarkerBuilder,
      this.onroutePois = const [],
      required this.hikeId,
      required this.cardHeight});

  @override
  PlacesOnRouteMapState createState() => PlacesOnRouteMapState();
}

class PlacesOnRouteMapState extends ConsumerState<PlacesOnRouteMap> {
  final MapController _mapController = MapController();
  bool _isLayerSelectorOn = false;
  TileLayer _mainTileLayer = osmTileLayer;
  final List<TileLayer> _optionalTilelayers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMapOnly = ref.watch(
        placesOnRouteMapControllerProvider(widget.hikeId)
            .select((value) => value.isMapOnly));

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

    return Stack(children: [
      Consumer(builder: (c, ref, child) {
        final bounds = ref.watch(
            placesOnRouteMapControllerProvider(widget.hikeId)
                .select((value) => value.mapBounds));

        return Stack(children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
                onTap: (_, __) {
                  ref
                      .read(placesOnRouteMapControllerProvider(widget.hikeId)
                          .notifier)
                      .hideAllModals();
                  setState(() {
                    _isLayerSelectorOn = false;
                  });
                },
                initialCameraFit: CameraFit.bounds(bounds: bounds)),
            children: <Widget>[
              _mainTileLayer,
              if (!isMapOnly) _getHikeLayerWidget(),
              ..._optionalTilelayers,
              if (!isMapOnly) _getMarkerLayerWidget(),
              if (!isMapOnly) _getMarkerClusterLayerWidget(),
            ],
          ),
          if (bounds != null)
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.only(bottom: widget.cardHeight),
                    child: GlobalMapControl(
                        mapcontroller: _mapController, bounds: bounds)))
        ]);
      }),
      Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: EdgeInsets.only(top: widget.headerHeight),
              child: LayersControl(
                hikeId: widget.hikeId,
                onLayerPressed: onLayersPressed,
              ))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              margin: EdgeInsets.only(bottom: widget.cardHeight),
              child: Row(children: [
                HikeMapControl(hikeId: widget.hikeId),
                PoiFilterButton(hikeId: widget.hikeId)
              ]))),
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
                ))),
      Consumer(builder: (c, ref, child) {
        final isPoiFilterOn = ref.watch(
            placesOnRouteMapControllerProvider(widget.hikeId)
                .select((value) => value.isPoifilterOn));

        return isPoiFilterOn
            ? Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.6,
                    child: PoiSelectorModal(
                      hikeId: widget.hikeId,
                    )))
            : Container();
      }),
      Consumer(builder: (c, ref, child) {
        final tappedOffroutePoi = ref.watch(
            placesOnRouteMapControllerProvider(widget.hikeId)
                .select((value) => value.tappedOffroutePoiIcon));
        final hike = ref.watch(placesOnRouteMapControllerProvider(widget.hikeId)
            .select((value) => value.hike));

        return tappedOffroutePoi != null && hike != null
            ? Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(
                        top: widget.headerHeight + 55, left: 10.0),
                    child: PoiPopup(
                      poiId: tappedOffroutePoi,
                      hike: hike,
                    )))
            : Container();
      }),
      Consumer(builder: (c, ref, child) {
        final showLoader = ref.watch(
            placesOnRouteMapControllerProvider(widget.hikeId)
                .select((value) => value.showLoader));
        return showLoader
            ? Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.primary))
            : Container();
      })
    ]);
  }

  _getHikeLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final hike = ref.watch(placesOnRouteMapControllerProvider(widget.hikeId)
          .select((value) => value.hike));

      if (hike != null) {
        final line = Function.apply(
            Polyline.new, [], {...trackBaseProps(hike), #strokeWidth: 10.0});
        return PolylineLayer(polylines: [line]);
      } else {
        return PolylineLayer(polylines: const []);
      }
    });
  }

  _getMarkerLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final markers = ref.watch(
          placesOnRouteMapControllerProvider(widget.hikeId)
              .select((value) => value.allMarkers));

      return MarkerLayer(
        markers: markers,
      );
    });
  }

  _getMarkerClusterLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final offroutePois =
          ref.watch(filteredPoisAroundHikeProvider(widget.hikeId));

      return offroutePois.when(data: (offroutePois) {
        final onrouteMarkers = widget.onroutePoiMarkerBuilder == null
            ? const <Marker>[]
            : widget.onroutePois
                .mapIndexed<Marker>((index, poi) =>
                    widget.onroutePoiMarkerBuilder!(context, poi, index))
                .toList();

        final offrouteMarkers = offroutePois
            .mapIndexed<Marker>(
                (index, poi) => _offroutePoiMarkerBuilder(context, poi))
            .toList();

        return MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            markers: [...onrouteMarkers, ...(offrouteMarkers)],
            maxClusterRadius: 45,
            size: const Size(40, 40),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            maxZoom: 15,
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
      }, loading: () {
        return const CircularProgressIndicator();
      }, error: (err, stack) {
        return errorWidget(err, stack);
      });
    });
  }

  _offroutePoiMarkerBuilder(BuildContext context, PoiEntity poi) {
    const double markerSize = 25.0;

    return Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(
            poi.location.location.latitude, poi.location.location.longitude),
        child: GestureDetector(
          onTap: () {
            ref
                .read(
                    placesOnRouteMapControllerProvider(widget.hikeId).notifier)
                .onOffroutePoiIconTapped(poi.id);
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 2500),
              child: FittedBox(
                  child: PhysicalModel(
                      color: Colors.black,
                      shadowColor: Colors.black,
                      elevation: 8.0,
                      shape: BoxShape.circle,
                      child: PoiIcon(poiType: poi.poiType)))),
        ));
  }
}
