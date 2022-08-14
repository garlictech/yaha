import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

import '../../domain/entities/entities.dart';

abstract class GeocalcService {
  Future<double> distanceOnLine(
      Location start, Location end, LineStringData path);

  Future<BoundingBox> boundingBoxOfPaths(List<LineStringData> paths);
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
}
