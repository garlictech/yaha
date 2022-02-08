import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/models/ModelProvider.dart';
import 'hike-repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class HikeRepositoryAmplify implements HikeRepository {
  @override
  getHikeList() async {
    String gqlDocument = ''' 
          query ListHikes {
    listHikes {
      items {
        id
        description {
          languageKey
          title
          summary
          fullDescription
          type
        }
        location
        featured
        rate
        offlineMap
        featuredStops {
          poiId
          description {
            languageKey
            title
            summary
            fullDescription
            type
          }
        }
        checkpoints {
          id
          location {
            lat
            lon
            ele
          }
          types
          description {
            languageKey
            title
            summary
            fullDescription
            type
          }
          tags
          sourceObject {
            objectType
            languageKey
            objectId
            url
          }
          address
          phoneFloat
          openingHours
          createdAt
          updatedAt
          _version
          _deleted
          _lastChangedAt
        }
        tags
        route {
          type
          coordinates
        }
        startPoint {
          lat
          lon
          ele
        }
        endPoint {
          lat
          lon
          ele
        }
        imageUrls
        createdAt
        updatedAt
        _version
        _deleted
        _lastChangedAt
      }
      nextToken
      startedAt
    }
  }
  ''';
    try {
      debugPrint('HERE');
      var request = GraphQLRequest<String>(document: gqlDocument);
      var operation = Amplify.API.query(request: request);
      var response = await operation.response;
      debugPrint('HERE2');
      var data = response.data;
      debugPrint(data.toString());
      return [];
    } on ApiException catch (e) {
      debugPrint('Query failed: $e');
      return [];
    }
    /*try {
      // Todo: wait for proper amplify initialization
      await Future.delayed(const Duration(seconds: 2));
      return await Amplify.DataStore.query(Hike.classType);
    } on DataStoreException catch (e) {
      debugPrint('Hike query failed: $e');
      throw ('Hike query failed: $e');
    }
    */
  }
}

final hikeRepository = Provider<HikeRepository>(
  (ref) => HikeRepositoryAmplify(),
);
