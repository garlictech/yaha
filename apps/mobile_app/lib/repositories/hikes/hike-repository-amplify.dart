import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/entities/hike/hike.dart';
import 'hike-repository.dart';
import 'package:amplify_api/amplify_api.dart';

class HikeRepositoryAmplify implements HikeRepository {
  @override
  getHikeList() async {
    String gqlDocument = ''' 
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
    ''';

    try {
      var request = GraphQLRequest<String>(document: gqlDocument);
      var operation = Amplify.API.query(request: request);
      var response = await operation.response;
      return jsonDecode(response.data)['listHikes']['items']
          .map<Hike>((hike) => Hike.fromJson(hike))
          .toList();
    } on ApiException catch (e) {
      debugPrint('Query failed: $e');
      return [];
    }
  }
}

final hikeRepository = Provider<HikeRepository>(
  (ref) => HikeRepositoryAmplify(),
);
