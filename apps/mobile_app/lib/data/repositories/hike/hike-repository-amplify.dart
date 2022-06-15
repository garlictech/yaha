import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/foundation.dart';
import 'package:yaha/data/utils/cache/cache.dart';
import 'package:yaha/domain/domain.dart';

class HikeRepositoryAmplify implements HikeRepository {
  final _hikeCache = DataCache();

  @override
  getHikeList() async {
    String gqlDocument = ''' 
      query ListHikes {
        listHikes {
          items {
            id
            description {
              title
              languageKey
              summary
              type
            }
            route {
              type
              coordinates
            }
            closestPlace
          }
          nextToken
        }
      }
    ''';

    var request = GraphQLRequest<String>(document: gqlDocument);
    var operation = Amplify.API.query(request: request);
    var response = await operation.response;
    var hikes = jsonDecode(response.data)['listHikes']['items']
        .map<Hike>((hike) => Hike.fromJson(hike))
        .toList();

    hikes.forEach((hike) => _hikeCache.addData(hike.id, hike));
    return hikes;
  }

  @override
  searchHikeByRadius(SearchHikeByRadiusInput input) async {
    String gqlDocument = ''' 
      query SearchHikeByRadius(\$query: SearchHikeByRadiusInput!) {
        searchHikeByRadius(query: \$query) {
          items
          nextToken
          total
        }
      }
    ''';

    var request = GraphQLRequest<String>(
        document: gqlDocument, variables: Map.from({'query': input.toJson()}));
    var operation = Amplify.API.query(request: request);
    return operation.response.then((response) {
      return List<String>.from(
          jsonDecode(response.data)['searchHikeByRadius']['items']);
    });
  }

  @override
  getHike(String id) async {
    if (_hikeCache.containsKey(id)) {
      return _hikeCache.getData(id);
    }

    String gqlDocument = ''' 
      query GetHike(\$id: ID!) {
        getHike(id: \$id) {
            id
            description {
              title
              languageKey
              summary
              type
            }
            route {
              type
              coordinates
            }
            closestPlace
        }
      }
    ''';

    var request =
        GraphQLRequest<String>(document: gqlDocument, variables: {"id": id});
    var operation = Amplify.API.query(request: request);
    return operation.response.then((response) {
      final hike = Hike.fromJson(jsonDecode(response.data)['getHike']);
      _hikeCache.addData(id, hike);
      return hike;
    });
  }
}
