import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/foundation.dart';
import 'package:yaha/data/utils/graphql/generated/yaha-api.graphql.dart'
    as yaha_api;
import 'package:yaha/domain/domain.dart';

class ImageRepositoryAmplify implements ImageRepository {
  @override
  getImage(String id) async {
    String gqlDocument = ''' 
      query GetImage(\$id: ID!)
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
        GraphQLRequest<String>(document: gqlDocument, variables: {id: id});
    var operation = Amplify.API.query(request: request);
    return operation.response.then(
        (response) => Image.fromJson(jsonDecode(response.data)['getImage']));
  }

  @override
  searchImagesAroundHike(SearchAroundHikeInput input) async {
    String gqlDocument = ''' 
      query SearchImagesAroundHike(\$query: SearchAroundHikeInput!) {
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
    return operation.response.then((response) {
      debugPrint(response.toString());
      return jsonDecode(response.data)['searchAroundHike']['items'].toList();
    });
  }
}
