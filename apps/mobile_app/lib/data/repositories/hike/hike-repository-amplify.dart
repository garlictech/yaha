import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:yaha/domain/domain.dart';

class HikeRepositoryAmplify implements HikeRepository {
  @override
  getHikeList() async {
    return _executeQuery(''' 
      query ListHikes {
        listHikes {
          items {
            id
            imageUrls
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
          }
          nextToken
        }
      }
    ''');
  }

  @override
  searchImagesAroundHike(SearchAroundHikeInput input) async {
    return _executeQuery(''' 
      query SearchAroundLine(\$query: SearchAroundLineInput!) {
        searchAroundLine(query: \$query) {
          items 
          nextToken
          total
        }
      }
    ''', input.toJson());
  }

  _executeQuery(String gqlDocument,
      [Map<String, dynamic> variables = const {}]) async {
    try {
      var request =
          GraphQLRequest<String>(document: gqlDocument, variables: variables);
      var operation = Amplify.API.query(request: request);
      var response = await operation.response;
      final result = Right<Failure, List<Hike>>(
          jsonDecode(response.data)['listHikes']['items']
              .map<Hike>((hike) => Hike.fromJson(hike))
              .toList());
      debugPrint(result.toString());
      return result;
    } on ApiException catch (e) {
      debugPrint('Query failed: $e');
      return const Right([]);
    }
  }
}
