// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaflet-map-viewmodel.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $LeafletMapViewmodel {
  const $LeafletMapViewmodel();

  List<Hike> get hikes;
  List<Poi> get pois;
  Location? get mapCenter;

  LeafletMapViewmodel copyWith({
    List<Hike>? hikes,
    List<Poi>? pois,
    Location? mapCenter,
  }) =>
      LeafletMapViewmodel(
        hikes: hikes ?? this.hikes,
        pois: pois ?? this.pois,
        mapCenter: mapCenter ?? this.mapCenter,
      );

  LeafletMapViewmodel copyUsing(
      void Function(LeafletMapViewmodel$Change change) mutator) {
    final change = LeafletMapViewmodel$Change._(
      this.hikes,
      this.pois,
      this.mapCenter,
    );
    mutator(change);
    return LeafletMapViewmodel(
      hikes: change.hikes,
      pois: change.pois,
      mapCenter: change.mapCenter,
    );
  }

  @override
  String toString() =>
      "LeafletMapViewmodel(hikes: $hikes, pois: $pois, mapCenter: $mapCenter)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is LeafletMapViewmodel &&
      other.runtimeType == runtimeType &&
      hikes == other.hikes &&
      pois == other.pois &&
      mapCenter == other.mapCenter;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + hikes.hashCode;
    result = 37 * result + pois.hashCode;
    result = 37 * result + mapCenter.hashCode;
    return result;
  }
}

class LeafletMapViewmodel$Change {
  LeafletMapViewmodel$Change._(
    this.hikes,
    this.pois,
    this.mapCenter,
  );

  List<Hike> hikes;
  List<Poi> pois;
  Location? mapCenter;
}

// ignore: avoid_classes_with_only_static_members
class LeafletMapViewmodel$ {
  static final hikes = Lens<LeafletMapViewmodel, List<Hike>>(
    (hikesContainer) => hikesContainer.hikes,
    (hikesContainer, hikes) => hikesContainer.copyWith(hikes: hikes),
  );

  static final pois = Lens<LeafletMapViewmodel, List<Poi>>(
    (poisContainer) => poisContainer.pois,
    (poisContainer, pois) => poisContainer.copyWith(pois: pois),
  );

  static final mapCenter = Lens<LeafletMapViewmodel, Location?>(
    (mapCenterContainer) => mapCenterContainer.mapCenter,
    (mapCenterContainer, mapCenter) =>
        mapCenterContainer.copyWith(mapCenter: mapCenter),
  );
}
