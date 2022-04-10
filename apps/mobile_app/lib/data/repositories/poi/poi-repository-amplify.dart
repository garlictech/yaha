import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:yaha/domain/domain.dart';

import '../../utils/cache/cache.dart';

class PoiRepositoryAmplify implements PoiRepository {
  final _poiCache = DataCache();

  @override
  getPoi(String id) async {
    if (_poiCache.containsKey(id)) {
      return _poiCache.getData(id);
    }

    String gqlDocument = ''' 
      query GetPoi(\$id: ID!) {
        getPoi(id: \$id) {
          id
          elevation
          location {
            lat
            lon
          }
          types
          description {
            title
            languageKey
            summary
            type
          }
          tags
          address 
          phoneNumber
          openingHours
        }
      }
    ''';

    var request =
        GraphQLRequest<String>(document: gqlDocument, variables: {"id": id});
    var operation = Amplify.API.query(request: request);
    return operation.response.then((response) {
      final poi = Poi.fromJson(jsonDecode(response.data)['getPoi']);
      _poiCache.addData(id, poi);
      return poi;
    });
  }

  @override
  searchPoisAroundHike(SearchAroundHikeInput input) async {
    String gqlDocument = ''' 
      query SearchPoisAroundHike(\$query: SearchAroundHikeInput!) {
        searchAroundHike(query: \$query) {
          items
          nextToken
          total
        }
      }
    ''';
    var request = GraphQLRequest<String>(
        document: gqlDocument, variables: Map.from({'query': input.toJson()}));
    var operation = Amplify.API.query(request: request);
    return operation.response.then((response) => List<String>.from(
        jsonDecode(response.data)['searchAroundHike']['items']));
  }
}
