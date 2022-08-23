import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:turf/turf.dart';

import '../../domain/entities/entities.dart';

abstract class GeocalcService {
  Future<double> distanceOnLine(
      Location start, Location end, LineStringData path);

  Future<BoundingBox> boundingBoxOfPaths(List<LineStringData> paths);
  Future<LineString> snappedLineSlice(
      Location start, Location end, LineStringData path);
  Future<num> approximateAltitude(Location pointOnLinee, LineStringData path);
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
  distanceOnLine(Location start, Location end, LineStringData path) async {
    final startStr = start.toJson().toString();
    final endStr = end.toJson().toString();
    final pathStr = path.toLinestringFeatureString();

    return _isLoaded
        .then((_x) => _jsRuntime.evaluateAsync("""
            global.distanceOnLineForFlutter($startStr, $endStr, $pathStr);"""))
        .then((res) => double.parse(res.stringResult));
  }

  @override
  boundingBoxOfPaths(List<LineStringData> paths) async {
    final pathStr = paths.map((path) => jsonEncode(path)).join(",");
    return _isLoaded.then((_x) => _jsRuntime.evaluateAsync("""
            global.boundingBoxOfPaths([$pathStr]);""")).then((res) {
      return BoundingBox.fromJson(jsonDecode(res.stringResult));
    });
  }

  @override
  snappedLineSlice(Location start, Location end, LineStringData path) async {
    final pathStr = path.toLinestringFeatureString();
    final startStr = start.toJson().toString();
    final endStr = end.toJson().toString();

    return _isLoaded
        .then((_x) => _jsRuntime.evaluateAsync("""
            global.snappedLineSlice($startStr, $endStr, $pathStr);"""))
        .then((res) {
      return LineString.fromJson(jsonDecode(res.stringResult)['geometry']);
    });
  }

  @override
  approximateAltitude(Location pointOnLinee, LineStringData path) async {
    final firstPoint = (await snappedLineSlice(
            Location(
                lat: path.coordinates.first[1], lon: path.coordinates.first[0]),
            pointOnLinee,
            path))
        .coordinates
        .last;

    final lastPoint = (await snappedLineSlice(
            pointOnLinee,
            Location(
                lat: path.coordinates.last[1], lon: path.coordinates.last[0]),
            path))
        .coordinates
        .first;

    if (firstPoint[2] == null || lastPoint[2] == null) {
      throw "Missing altitude!";
    }

    return (firstPoint[2]! + lastPoint[2]!) / 2;
  }
}
