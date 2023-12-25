import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:flutter_yaha_lib/data/utils/neo4j-repository.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';

class HikeRepositoryNeo4j extends RepositoryNeo4j<HikeEntity>
    implements HikeRepository {
  HikeRepositoryNeo4j({required Ref ref})
      : super(ref: ref, fromJson: HikeEntity.fromJson);

  @override
  getHikeList() async {
    const String query = r'''
    query Hikes {
      hikes {
        id
      }
    }''';

    return getEntityList(query, 'hikes');
  }

  @override
  searchHikeByRadius(SearchByRadiusInput input) async {
    const String query = r'''
  query Query($params: SearchByRadiusInput!) {
  searchHikeByRadius(params: $params)
}
    ''';

    return searchEntityByRadius(input, query, 'searchHikeByRadius');
  }

  @override
  getHike(String id) async {
    const String query = r'''
    query Hikes($where: HikeWhere) {
      hikes(where: $where) {
        id
        featured
        rate
        tags
        publicationState
        descriptions {
          languageKey
          title
          summary
          fullDescription
          type
        }
        route {
          id
          coordinates {
            location {
              longitude
              latitude
              height
            }
          }
          municipality
          images {
            original
            card
            thumbnail
          }
        }
      }
    }''';

    return getEntity(query, id, 'hikes');
  }

  @override
  searchHikeByContent(SearchByContentInput input) async {
    const String query = r'''
  query Query($params: String!) {
  searchHikeByContent(params: $params)
}
    ''';

    return searchEntityByContent(input.content, query, 'searchHikeByContent');
  }

  @override
  getOnroutePois(String id) async {
    return _getRoutePois(id, 'onroutePois');
  }

  @override
  getOffroutePois(String id) async {
    return _getRoutePois(id, 'offroutePois');
  }

  @override
  Future<List<String>> getRandomHikes(int limit) async {
    const String query = r'''
       query Query($limit: Int!) {
          getRandomHikes(limit: $limit) 
       }
    ''';
    return executeEntityIdQuery(query, 'getRandomHikes', {'limit': limit});
  }

  Future<List<Poi>> _getRoutePois(String id, String routeLabel) async {
    String query = '''
    query Hikes(\$where: HikeWhere) {
      hikes(where: \$where) {
        route {
          $routeLabel {
            id
            type
            tags
            address
            phone
            infoUrl
            openingHours
            images {
              thumbnail
              card
              original
            }
            location {
              location {
                longitude
                latitude
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

    final entityData = result.data?['hikes']?[0]?['route']?[routeLabel];

    if (entityData != null) {
      return (entityData as List)
          .map((entity) => Poi.fromJson(entity))
          .toList();
    } else {
      throw "$routeLabel of hike $id cannot be found.";
    }
  }
}
