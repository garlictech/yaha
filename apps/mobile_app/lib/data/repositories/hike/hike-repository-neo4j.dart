import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:yaha/domain/domain.dart';

import '../../utils/cache/cache.dart';
import '../repositories.dart';

class HikeRepositoryNeo4j implements HikeRepository {
  late final GraphQLClient client;
  final _hikeCache = DataCache();

  HikeRepositoryNeo4j({required Ref ref}) {
    client = ref.read(graphqlClientProvider);
  }

  @override
  getHikeList() async {
    const String query = r'''
    query Hikes {
      hikes {
        id
        route {
          id
          coordinates {
            latitude
            longitude
            height
          }
          startPoint {
            latitude
            longitude
            height
          }
          endPoint {
            latitude
            longitude
            height
          }
        }
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
    }''';

    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    var hikes = result.data != null
        ? result.data!['hikes']
            .map<Hike>((hike) => Hike.fromJson(hike))
            .toList()
        : const [];

    hikes.forEach((hike) => _hikeCache.addData(hike.id, hike));
    return hikes;
  }

  @override
  searchHikeByRadius(SearchHikeByRadiusInput input) async {
    const String query = r'''
    query Hikes {
      hikes {
        id
      }
    }''';

    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    final List<String> hikeIds = result.data != null
        ? (result.data!['hikes'] as List<dynamic>).map((hike) {
            return hike['id'] as String;
          }).toList()
        : const [];

    return hikeIds;
  }

  @override
  getHike(String id) async {
    if (_hikeCache.containsKey(id)) {
      return _hikeCache.getData(id);
    }

    const String query = r'''
    query Hikes($where: HikeWhere) {
      hikes(where: $where) {
        id
        route {
          id
          coordinates {
            latitude
            longitude
            height
          }
          startPoint {
            latitude
            longitude
            height
          }
          endPoint {
            latitude
            longitude
            height
          }
        }
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
    }''';

    final QueryOptions options =
        QueryOptions(document: gql(query), variables: <String, dynamic>{
      "where": {"id": id}
    });

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    final hikeData = result.data?['hikes']?[0];

    if (hikeData != null) {
      final hike = Hike.fromJson(result.data!['hikes']![0]);
      _hikeCache.addData(id, hike);
      return hike;
    } else {
      return null;
    }
  }

  @override
  searchHikeByContent(SearchByContentInput input) async {
    const String query = r'''
    query Hikes($where: HikeWhere) {
      hikes(where: $where) {
        id
        route {
          id
          coordinates {
            latitude
            longitude
            height
          }
          startPoint {
            latitude
            longitude
            height
          }
          endPoint {
            latitude
            longitude
            height
          }
        }
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
    }''';

    final QueryOptions options =
        QueryOptions(document: gql(query), variables: <String, dynamic>{
      "where": {
        "descriptions_SOME": {"title_CONTAINS": input.content}
      }
    });

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    final hikeData = result.data?['hikes'];
    var hikes = hikeData != null
        ? jsonDecode(hikeData).map<Hike>((hike) => Hike.fromJson(hike)).toList()
        : const [];

    hikes.forEach((hike) => _hikeCache.addData(hike.id, hike));
    return hikes;
  }
}
