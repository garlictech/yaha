import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/use-cases/poi/filtered_pois_along_hike.dart';
import 'package:yaha/ui/views/screens/poi_info_screen.dart';

import 'package:yaha/ui/views/poi/poi-icon.dart';
import 'package:yaha/ui/views/poi/poi_list_item.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../presenters/map/map.dart';
import 'places_on_route_map.dart';

/// Renders the map widget with OSM map.
class PoisOfHikeMap extends ConsumerStatefulWidget {
  final domain.Hike hike;

  /// Creates the map widget with OSM map.
  const PoisOfHikeMap({Key? key, required this.hike}) : super(key: key);

  @override
  PoisOfHikeMapState createState() => PoisOfHikeMapState();
}

class PoisOfHikeMapState extends ConsumerState<PoisOfHikeMap>
    with SingleTickerProviderStateMixin {
  late PageController _pageViewController;

  late int _currentSelectedIndex;
  late int _tappedMarkerIndex;
  late int _cardNum;

  final double _cardHeight = 110;
  late bool _canUpdateFocalLatLng;

  @override
  void initState() {
    _currentSelectedIndex = 0;
    _cardNum = 0;
    _canUpdateFocalLatLng = true;

    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final poisAlongHike =
        ref.watch(filteredPoisAlongHikeProvider(widget.hike.id)).data ?? [];
    final mapPresenter = ref.read(leafletMapMVPProvider.notifier);

    if (poisAlongHike.length != _cardNum) {
      _currentSelectedIndex = 0;
      _cardNum = poisAlongHike.length;
    }

    _pageViewController = PageController(
        initialPage: _currentSelectedIndex,
        viewportFraction:
            (MediaQuery.of(context).orientation == Orientation.landscape)
                ? 0.7
                : 0.8);

    onroutePoiMarkerBuilder(BuildContext context, domain.Poi poi, int index) {
      final double markerSize = _currentSelectedIndex == index ? 50 : 25;
      final key = _currentSelectedIndex == index ? "CURRENT" : index.toString();

      return Marker(
          key: Key(key),
          height: markerSize,
          width: markerSize,
          point: LatLng(
              poi.location.location.latitude, poi.location.location.longitude),
          builder: (BuildContext c) {
            return GestureDetector(
              onTap: () {
                if (_currentSelectedIndex != index) {
                  _canUpdateFocalLatLng = false;
                  _tappedMarkerIndex = index;
                  _pageViewController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
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
            );
          });
    }

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/maps_grid.png',
            repeat: ImageRepeat.repeat,
          ),
        ),
        PlacesOnRouteMap(
            onroutePoiMarkerBuilder: onroutePoiMarkerBuilder,
            hikeId: widget.hike.id,
            onroutePois: poisAlongHike,
            cardHeight: _cardHeight),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _cardHeight,
            padding: const EdgeInsets.only(bottom: 10),

            /// PageView which shows the poi details at the bottom.
            child: PageView.builder(
              itemCount: poisAlongHike.length,
              onPageChanged: (index) =>
                  _handlePageChange(index, poisAlongHike, mapPresenter),
              controller: _pageViewController,
              itemBuilder: (BuildContext context, int index) {
                final item = poisAlongHike[index];
                return Transform.scale(
                  scale: index == _currentSelectedIndex ? 1 : 0.85,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(66, 66, 66, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(153, 153, 153, 1),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: PoiListItem(
                            poi: item,
                          )),
                      // Adding splash to card while tapping.
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(10, 10)),
                          onTap: () {
                            if (_currentSelectedIndex != index) {
                              _pageViewController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PoiInfoScreen(
                                          poi: item, hike: widget.hike)));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handlePageChange(
      int index, List<domain.Poi> pois, LeafletMapPresenter mapPresenter) {
    /// While updating the page viewer through interaction, selected position's
    /// marker should be moved to the center of the maps. However, when the
    /// marker is directly clicked, only the respective card should be moved to
    /// center and the marker itself should not move to the center of the maps.
    if (!_canUpdateFocalLatLng) {
      if (_tappedMarkerIndex == index) {
        _updateSelectedCard(index, pois, mapPresenter);
      }
    } else if (_canUpdateFocalLatLng) {
      _updateSelectedCard(index, pois, mapPresenter);
    }
  }

  void _updateSelectedCard(
      int index, List<domain.Poi> pois, LeafletMapPresenter mapPresenter) {
    setState(() {
      _currentSelectedIndex = index;
    });

    /// While updating the page viewer through interaction, selected position's
    /// marker should be moved to the center of the maps. However, when the
    /// marker is directly clicked, only the respective card should be moved to
    /// center and the marker itself should not move to the center of the maps.
    if (_canUpdateFocalLatLng) {
      mapPresenter.mapCenter = domain.Location(
        lat: pois[_currentSelectedIndex].location.location.latitude,
        lon: pois[_currentSelectedIndex].location.location.longitude,
      );
    }

    /// Updating the design of the selected marker. Please check the
    /// `markerBuilder` section in the build method to know how this is done.
    //_mapController
    //  .updateMarkers(<int>[_currentSelectedIndex, _previousSelectedIndex]);
    _canUpdateFocalLatLng = true;
  }
}