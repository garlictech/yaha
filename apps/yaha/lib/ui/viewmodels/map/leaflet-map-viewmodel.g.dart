// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaflet-map-viewmodel.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $LeafletMapViewmodel {
  const $LeafletMapViewmodel();

  Location? get mapCenter;

  LeafletMapViewmodel copyWith({
    Location? mapCenter,
  }) =>
      LeafletMapViewmodel(
        mapCenter: mapCenter ?? this.mapCenter,
      );

  LeafletMapViewmodel copyUsing(
      void Function(LeafletMapViewmodel$Change change) mutator) {
    final change = LeafletMapViewmodel$Change._(
      this.mapCenter,
    );
    mutator(change);
    return LeafletMapViewmodel(
      mapCenter: change.mapCenter,
    );
  }

  @override
  String toString() => "LeafletMapViewmodel(mapCenter: $mapCenter)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is LeafletMapViewmodel &&
      other.runtimeType == runtimeType &&
      mapCenter == other.mapCenter;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return mapCenter.hashCode;
  }
}

class LeafletMapViewmodel$Change {
  LeafletMapViewmodel$Change._(
    this.mapCenter,
  );

  Location? mapCenter;
}

// ignore: avoid_classes_with_only_static_members
class LeafletMapViewmodel$ {
  static final mapCenter = Lens<LeafletMapViewmodel, Location?>(
    (mapCenterContainer) => mapCenterContainer.mapCenter,
    (mapCenterContainer, mapCenter) =>
        mapCenterContainer.copyWith(mapCenter: mapCenter),
  );
}
