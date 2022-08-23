import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:yaha/data/utils/cache/cache.dart';
import 'package:yaha/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_js/flutter_js.dart';

class HikeRepositoryNeo4j implements HikeRepository {
  final _hikeCache = DataCache();
  final JavascriptRuntime _jsRuntime;
  late Future<bool> _isLoaded;
  static const username = "neo4j";
  static const password = "LoaFhpCe4xTAvjTxBV4qh60POy4Hi7pC9n2DhhKPQdU";
  static const apiUrl = "https://cf48806f.databases.neo4j.io/db/neo4j/tx";

  @override
  getHikeList() async {
    return [];
  }

  @override
  searchHikeByRadius(SearchHikeByRadiusInput input) async {
    final inputStr = input.toJson().toString();

    return _isLoaded.then((_x) => _jsRuntime.evaluateAsync("""
            global.searchHikeByRadius($inputStr);""")).then((res) {
      return jsonDecode(res.stringResult);
    });
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    return Dio()
        .post(apiUrl,
            data: {
              'statements': [
                {
                  'statement': """
              match (w:Waypoint) where point.distance(point({latitude: w.latitude, longitude: w.longitude}), point({latitude: 47.858627, longitude: 19.99034})) < 20000
match (h:Hike)-[:GOES_ON]->(:Route)-[:CONTAINS]->(w)
return collect(distinct h) limit 25
            """
                }
              ]
            },
            options:
                Options(headers: <String, String>{'authorization': basicAuth}))
        .then((result) {
      debugPrint("$result");
      return [];
    });
  }

  @override
  getHike(String id) async {
    return null;
  }

  @override
  searchHikeByContent(SearchByContentInput input) async {
    return [];
  }
}
