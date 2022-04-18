import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/foundation.dart';
import 'package:yaha/domain/domain.dart';

import '../../utils/cache/cache.dart';

class ImageRepositoryAmplify implements ImageRepository {
  final _imageCache = DataCache();

  @override
  getImage(String id) async {
    if (_imageCache.containsKey(id)) {
      return _imageCache.getData(id);
    }

    String gqlDocument = ''' 
      query GetImage(\$id: ID!) {
        getImage(id: \$id) {
          id
          location {
            lat
            lon
          }
          original {
            url
            width
            height
          }
          card {
            url
            width
            height
          }
          thumbnail {
            url
            width
            height
          }
          attributions
        }
      }
    ''';

    var request =
        GraphQLRequest<String>(document: gqlDocument, variables: {"id": id});
    var operation = Amplify.API.query(request: request);
    return operation.response.then((response) {
      final image = Image.fromJson(jsonDecode(response.data)['getImage']);
      _imageCache.addData(id, image);
      return image;
    });
  }

  @override
  searchImagesAroundHike(SearchSafeImagesAroundHikeInput input) async {
    String gqlDocument = ''' 
      query SearchImagesAroundHike(\$query: SearchSafeImagesAroundHikeInput!) {
        searchSafeImagesAroundHike(query: \$query) {
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
        jsonDecode(response.data)['searchSafeImagesAroundHike']['items']));
  }

  @override
  Future<List<String>> searchImagesAroundLocation(
      SearchByRadiusInput input) async {
    String gqlDocument = ''' 
      query MyQuery(\$query: SearchByRadiusInput!) {
        searchSafeImagesAroundLocation(query: \$query) {
          items
          nextToken
          total
        }
      }
    ''';
    var request = GraphQLRequest<String>(
        document: gqlDocument, variables: Map.from({'query': input.toJson()}));
    var response = await Amplify.API.query(request: request).response;
    return List<String>.from(
        jsonDecode(response.data)['searchSafeImagesAroundLocation']['items']);
  }
}
