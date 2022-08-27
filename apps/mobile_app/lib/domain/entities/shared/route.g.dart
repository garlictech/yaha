// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Route {
  const $Route();

  String get externalId;
  List<Waypoint> get coordinates;
  Waypoint get startPoint;
  Waypoint get endPoint;

  Route copyWith({
    String? externalId,
    List<Waypoint>? coordinates,
    Waypoint? startPoint,
    Waypoint? endPoint,
  }) =>
      Route(
        externalId: externalId ?? this.externalId,
        coordinates: coordinates ?? this.coordinates,
        startPoint: startPoint ?? this.startPoint,
        endPoint: endPoint ?? this.endPoint,
      );

  Route copyUsing(void Function(Route$Change change) mutator) {
    final change = Route$Change._(
      this.externalId,
      this.coordinates,
      this.startPoint,
      this.endPoint,
    );
    mutator(change);
    return Route(
      externalId: change.externalId,
      coordinates: change.coordinates,
      startPoint: change.startPoint,
      endPoint: change.endPoint,
    );
  }

  @override
  String toString() =>
      "Route(externalId: $externalId, coordinates: $coordinates, startPoint: $startPoint, endPoint: $endPoint)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Route &&
      other.runtimeType == runtimeType &&
      externalId == other.externalId &&
      coordinates == other.coordinates &&
      startPoint == other.startPoint &&
      endPoint == other.endPoint;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + externalId.hashCode;
    result = 37 * result + coordinates.hashCode;
    result = 37 * result + startPoint.hashCode;
    result = 37 * result + endPoint.hashCode;
    return result;
  }
}

class Route$Change {
  Route$Change._(
    this.externalId,
    this.coordinates,
    this.startPoint,
    this.endPoint,
  );

  String externalId;
  List<Waypoint> coordinates;
  Waypoint startPoint;
  Waypoint endPoint;
}

// ignore: avoid_classes_with_only_static_members
class Route$ {
  static final externalId = Lens<Route, String>(
    (externalIdContainer) => externalIdContainer.externalId,
    (externalIdContainer, externalId) =>
        externalIdContainer.copyWith(externalId: externalId),
  );

  static final coordinates = Lens<Route, List<Waypoint>>(
    (coordinatesContainer) => coordinatesContainer.coordinates,
    (coordinatesContainer, coordinates) =>
        coordinatesContainer.copyWith(coordinates: coordinates),
  );

  static final startPoint = Lens<Route, Waypoint>(
    (startPointContainer) => startPointContainer.startPoint,
    (startPointContainer, startPoint) =>
        startPointContainer.copyWith(startPoint: startPoint),
  );

  static final endPoint = Lens<Route, Waypoint>(
    (endPointContainer) => endPointContainer.endPoint,
    (endPointContainer, endPoint) =>
        endPointContainer.copyWith(endPoint: endPoint),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      externalId: json['externalId'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      startPoint: Waypoint.fromJson(json['startPoint'] as Map<String, dynamic>),
      endPoint: Waypoint.fromJson(json['endPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'externalId': instance.externalId,
      'coordinates': instance.coordinates,
      'startPoint': instance.startPoint,
      'endPoint': instance.endPoint,
    };
