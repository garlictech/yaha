import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:turf/turf.dart' as turf;

import '../../domain/entities/entities.dart';

abstract class GeocalcService {
  Future<double> distanceOnLine(Point start, Point end, LineStringData path);

  Future<BoundingBox> boundingBoxOfPaths(List<LineStringData> paths);
  Future<turf.LineString> snappedLineSlice(
      Point start, Point end, LineStringData path);
  Future<num> approximateAltitude(Point pointOnLinee, LineStringData path);
}

class GeocalcJs implements GeocalcService {
  final JavascriptRuntime _jsRuntime;
  late Future<bool> _isLoaded;

  GeocalcJs() : _jsRuntime = getJavascriptRuntime() {
    _isLoaded = rootBundle.loadString("assets/js/geocalc.js").then((geoJs) {
      _jsRuntime.evaluate("""var window = global = globalThis;""");
      _jsRuntime.evaluate(geoJs + "");
      return true;
    });
  }

  @override
  distanceOnLine(Point start, Point end, LineStringData path) async {
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

  @override
  boundingBoxOfPaths(List<LineStringData> paths) async {
    final pathStr = paths.map((path) => jsonEncode(path)).join(",");
    return _isLoaded.then((x) => _jsRuntime.evaluateAsync("""
            global.boundingBoxOfPaths([$pathStr]);""")).then((res) {
      return BoundingBox.fromJson(jsonDecode(res.stringResult));
    });
  }

  @override
  snappedLineSlice(Point start, Point end, LineStringData path) async {
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

  @override
  approximateAltitude(Point pointOnLinee, LineStringData path) async {
    final firstPoint = (await snappedLineSlice(
            Point(
                latitude: path.coordinates.first[1],
                longitude: path.coordinates.first[0],
                height: path.coordinates.first[2]),
            pointOnLinee,
            path))
        .coordinates
        .last;

    final lastPoint = (await snappedLineSlice(
            pointOnLinee,
            Point(
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
}
