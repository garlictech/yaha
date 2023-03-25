import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/entities/hike/hike.dart';

final yahaTileLayer = TileLayer(
    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    subdomains: const ['a', 'b', 'c']);

Map<Symbol, dynamic> trackBaseProps(Hike hike) {
  final points = hike.route.coordinates
      .map<LatLng>(
          (coord) => LatLng(coord.location.latitude, coord.location.longitude))
      .toList();

  return {
    #color: const Color.fromRGBO(200, 0, 0, 1),
    #strokeWidth: 4.0,
    #borderColor: Colors.blue,
    #borderStrokeWidth: 1.0,
    #points: points
  };
}
