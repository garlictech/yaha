// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_on_route_map_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PlacesOnRouteMapState {
  const $PlacesOnRouteMapState();

  List<PoiEntity>? get offroutePois;
  HikeEntity? get hike;
  List<Marker>? get globalMarkers;
  List<Marker>? get distanceMarkers;
  LatLngBounds? get mapBounds;
  bool get showLoader;
  bool get isMapOnly;
  bool get isPoifilterOn;
  bool get isOffroutePoisShown;
  String? get tappedOffroutePoiIcon;

  PlacesOnRouteMapState copyWith({
    List<PoiEntity>? offroutePois,
    HikeEntity? hike,
    List<Marker>? globalMarkers,
    List<Marker>? distanceMarkers,
    LatLngBounds? mapBounds,
    bool? showLoader,
    bool? isMapOnly,
    bool? isPoifilterOn,
    bool? isOffroutePoisShown,
    String? tappedOffroutePoiIcon,
  }) =>
      PlacesOnRouteMapState(
        offroutePois: offroutePois ?? this.offroutePois,
        hike: hike ?? this.hike,
        globalMarkers: globalMarkers ?? this.globalMarkers,
        distanceMarkers: distanceMarkers ?? this.distanceMarkers,
        mapBounds: mapBounds ?? this.mapBounds,
        showLoader: showLoader ?? this.showLoader,
        isMapOnly: isMapOnly ?? this.isMapOnly,
        isPoifilterOn: isPoifilterOn ?? this.isPoifilterOn,
        isOffroutePoisShown: isOffroutePoisShown ?? this.isOffroutePoisShown,
        tappedOffroutePoiIcon:
            tappedOffroutePoiIcon ?? this.tappedOffroutePoiIcon,
      );

  PlacesOnRouteMapState copyUsing(
      void Function(PlacesOnRouteMapState$Change change) mutator) {
    final change = PlacesOnRouteMapState$Change._(
      this.offroutePois,
      this.hike,
      this.globalMarkers,
      this.distanceMarkers,
      this.mapBounds,
      this.showLoader,
      this.isMapOnly,
      this.isPoifilterOn,
      this.isOffroutePoisShown,
      this.tappedOffroutePoiIcon,
    );
    mutator(change);
    return PlacesOnRouteMapState(
      offroutePois: change.offroutePois,
      hike: change.hike,
      globalMarkers: change.globalMarkers,
      distanceMarkers: change.distanceMarkers,
      mapBounds: change.mapBounds,
      showLoader: change.showLoader,
      isMapOnly: change.isMapOnly,
      isPoifilterOn: change.isPoifilterOn,
      isOffroutePoisShown: change.isOffroutePoisShown,
      tappedOffroutePoiIcon: change.tappedOffroutePoiIcon,
    );
  }

  @override
  String toString() =>
      "PlacesOnRouteMapState(offroutePois: $offroutePois, hike: $hike, globalMarkers: $globalMarkers, distanceMarkers: $distanceMarkers, mapBounds: $mapBounds, showLoader: $showLoader, isMapOnly: $isMapOnly, isPoifilterOn: $isPoifilterOn, isOffroutePoisShown: $isOffroutePoisShown, tappedOffroutePoiIcon: $tappedOffroutePoiIcon)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PlacesOnRouteMapState &&
      other.runtimeType == runtimeType &&
      offroutePois == other.offroutePois &&
      hike == other.hike &&
      globalMarkers == other.globalMarkers &&
      distanceMarkers == other.distanceMarkers &&
      mapBounds == other.mapBounds &&
      showLoader == other.showLoader &&
      isMapOnly == other.isMapOnly &&
      isPoifilterOn == other.isPoifilterOn &&
      isOffroutePoisShown == other.isOffroutePoisShown &&
      tappedOffroutePoiIcon == other.tappedOffroutePoiIcon;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + offroutePois.hashCode;
    result = 37 * result + hike.hashCode;
    result = 37 * result + globalMarkers.hashCode;
    result = 37 * result + distanceMarkers.hashCode;
    result = 37 * result + mapBounds.hashCode;
    result = 37 * result + showLoader.hashCode;
    result = 37 * result + isMapOnly.hashCode;
    result = 37 * result + isPoifilterOn.hashCode;
    result = 37 * result + isOffroutePoisShown.hashCode;
    result = 37 * result + tappedOffroutePoiIcon.hashCode;
    return result;
  }
}

class PlacesOnRouteMapState$Change {
  PlacesOnRouteMapState$Change._(
    this.offroutePois,
    this.hike,
    this.globalMarkers,
    this.distanceMarkers,
    this.mapBounds,
    this.showLoader,
    this.isMapOnly,
    this.isPoifilterOn,
    this.isOffroutePoisShown,
    this.tappedOffroutePoiIcon,
  );

  List<PoiEntity>? offroutePois;
  HikeEntity? hike;
  List<Marker>? globalMarkers;
  List<Marker>? distanceMarkers;
  LatLngBounds? mapBounds;
  bool showLoader;
  bool isMapOnly;
  bool isPoifilterOn;
  bool isOffroutePoisShown;
  String? tappedOffroutePoiIcon;
}

// ignore: avoid_classes_with_only_static_members
class PlacesOnRouteMapState$ {
  static final offroutePois = Lens<PlacesOnRouteMapState, List<PoiEntity>?>(
    (offroutePoisContainer) => offroutePoisContainer.offroutePois,
    (offroutePoisContainer, offroutePois) =>
        offroutePoisContainer.copyWith(offroutePois: offroutePois),
  );

  static final hike = Lens<PlacesOnRouteMapState, HikeEntity?>(
    (hikeContainer) => hikeContainer.hike,
    (hikeContainer, hike) => hikeContainer.copyWith(hike: hike),
  );

  static final globalMarkers = Lens<PlacesOnRouteMapState, List<Marker>?>(
    (globalMarkersContainer) => globalMarkersContainer.globalMarkers,
    (globalMarkersContainer, globalMarkers) =>
        globalMarkersContainer.copyWith(globalMarkers: globalMarkers),
  );

  static final distanceMarkers = Lens<PlacesOnRouteMapState, List<Marker>?>(
    (distanceMarkersContainer) => distanceMarkersContainer.distanceMarkers,
    (distanceMarkersContainer, distanceMarkers) =>
        distanceMarkersContainer.copyWith(distanceMarkers: distanceMarkers),
  );

  static final mapBounds = Lens<PlacesOnRouteMapState, LatLngBounds?>(
    (mapBoundsContainer) => mapBoundsContainer.mapBounds,
    (mapBoundsContainer, mapBounds) =>
        mapBoundsContainer.copyWith(mapBounds: mapBounds),
  );

  static final showLoader = Lens<PlacesOnRouteMapState, bool>(
    (showLoaderContainer) => showLoaderContainer.showLoader,
    (showLoaderContainer, showLoader) =>
        showLoaderContainer.copyWith(showLoader: showLoader),
  );

  static final isMapOnly = Lens<PlacesOnRouteMapState, bool>(
    (isMapOnlyContainer) => isMapOnlyContainer.isMapOnly,
    (isMapOnlyContainer, isMapOnly) =>
        isMapOnlyContainer.copyWith(isMapOnly: isMapOnly),
  );

  static final isPoifilterOn = Lens<PlacesOnRouteMapState, bool>(
    (isPoifilterOnContainer) => isPoifilterOnContainer.isPoifilterOn,
    (isPoifilterOnContainer, isPoifilterOn) =>
        isPoifilterOnContainer.copyWith(isPoifilterOn: isPoifilterOn),
  );

  static final isOffroutePoisShown = Lens<PlacesOnRouteMapState, bool>(
    (isOffroutePoisShownContainer) =>
        isOffroutePoisShownContainer.isOffroutePoisShown,
    (isOffroutePoisShownContainer, isOffroutePoisShown) =>
        isOffroutePoisShownContainer.copyWith(
            isOffroutePoisShown: isOffroutePoisShown),
  );

  static final tappedOffroutePoiIcon = Lens<PlacesOnRouteMapState, String?>(
    (tappedOffroutePoiIconContainer) =>
        tappedOffroutePoiIconContainer.tappedOffroutePoiIcon,
    (tappedOffroutePoiIconContainer, tappedOffroutePoiIcon) =>
        tappedOffroutePoiIconContainer.copyWith(
            tappedOffroutePoiIcon: tappedOffroutePoiIcon),
  );
}
