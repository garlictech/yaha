import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:yaha/domain/domain.dart';

class ImageRepositoryAmplify implements ImageRepository {
  @override
  getImage(String id) async {
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
    return operation.response.then(
        (response) => Image.fromJson(jsonDecode(response.data)['getImage']));
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
}
