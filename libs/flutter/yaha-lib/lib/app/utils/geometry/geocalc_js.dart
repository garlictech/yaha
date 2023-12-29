import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:turf/helpers.dart';
import 'package:turf/turf.dart' as turf;

class GeocalcJs {
  final JavascriptRuntime _jsRuntime;
  late Future<bool> _isLoaded;

  GeocalcJs() : _jsRuntime = getJavascriptRuntime() {
    _isLoaded = rootBundle
        .loadString('packages/flutter_yaha_lib/assets/js/geocalc.js')
        .then((geoJs) {
      _jsRuntime.evaluate("""var window = global = globalThis;""");
      _jsRuntime.evaluate(geoJs + "");
      return true;
    });
  }

  Future<double> distanceOnLine(
      GeoPoint start, GeoPoint end, LineStringData path) async {
    final startStr = start.asLatLon;
    final endStr = end.asLatLon;
    final pathStr = path.toLinestringFeatureString();

    return _isLoaded
        .then((x) => _jsRuntime.evaluateAsync("""
            global.distanceOnLineForFlutter($startStr, $endStr, $pathStr);"""))
        .then((res) {
      return double.parse(res.stringResult);
    });
  }

  boundingBoxOfPaths(List<LineStringData> paths) async {
    final pathStr = paths.map((path) => jsonEncode(path)).join(",");
    return _isLoaded.then((x) => _jsRuntime.evaluateAsync("""
            global.boundingBoxOfPaths([$pathStr]);""")).then((res) {
      return BoundingBox.fromJson(jsonDecode(res.stringResult));
    });
  }

  Future<LineString> snappedLineSlice(
      GeoPoint start, GeoPoint end, LineStringData path) async {
    final pathStr = path.toLinestringFeatureString();
    final startStr = start.asLatLon;
    final endStr = end.asLatLon;

    return _isLoaded
        .then((x) => _jsRuntime.evaluateAsync("""
            global.snappedLineSlice($startStr, $endStr, $pathStr);"""))
        .then((res) {
      return turf.LineString.fromJson(jsonDecode(res.stringResult)['geometry']);
    });
  }

  approximateAltitude(GeoPoint pointOnLinee, LineStringData path) async {
    final firstPoint = (await snappedLineSlice(
            GeoPoint(
                latitude: path.coordinates.first[1],
                longitude: path.coordinates.first[0],
                height: path.coordinates.first[2]),
            pointOnLinee,
            path))
        .coordinates
        .last;

    final lastPoint = (await snappedLineSlice(
            pointOnLinee,
            GeoPoint(
                latitude: path.coordinates.last[1],
                longitude: path.coordinates.last[0],
                height: path.coordinates.last[2]),
            path))
        .coordinates
        .first;

    if (firstPoint[2] == null || lastPoint[2] == null) {
      throw "Missing altitude!";
    }

    return (firstPoint[2]! + lastPoint[2]!) / 2;
  }

  Future<List<LatLng>> getFixedDistanceCoordinates(
      LineStringData path, double chunkLengthInKm) {
    final pathStr = path.toLinestringFeatureString();

    return _isLoaded
        .then((x) => _jsRuntime.evaluateAsync("""
            global.getFixedDistanceCoordinates($pathStr, $chunkLengthInKm);"""))
        .then((res) {
      final decoded = jsonDecode(res.stringResult);
      return decoded
          .map<LatLng>((point) => LatLng(point["lat"], point["lon"]))
          .toList();
    });
  }
}
