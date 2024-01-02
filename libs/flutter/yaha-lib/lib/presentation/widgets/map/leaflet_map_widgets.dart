import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';

final googleSatelliteTileLayer = TileLayer(
    urlTemplate: "http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",
    subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
    maxZoom: 20);

final osmTileLayer = TileLayer(
    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    subdomains: const ['a', 'b', 'c']);

final topoTileLayer = TileLayer(
    urlTemplate: "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
    subdomains: const ['a', 'b', 'c']);

final waymarkedTrails = TileLayer(
  urlTemplate: "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png",
  backgroundColor: Colors.transparent,
);

Map<Symbol, dynamic> trackBaseProps(HikeEntity hike) {
  final points = hike.trail.coordinates
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
