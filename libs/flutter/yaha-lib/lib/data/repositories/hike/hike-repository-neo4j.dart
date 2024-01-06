import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:flutter_yaha_lib/data/utils/neo4j-repository.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

class HikeRepositoryNeo4j extends RepositoryNeo4j<TrackEntity>
    implements TrackRepository {
  HikeRepositoryNeo4j({required super.ref})
      : super(fromJson: TrackEntity.fromJson);

  @override
  getTrackList() async {
    const String query = r'''
    query Hikes {
      hikes {
        id
      }
    }''';

    return getEntityList(query, 'hikes');
  }

  @override
  searchTrackByRadius(SearchByRadiusInput input) async {
    const String query = r'''
  query Query($params: SearchByRadiusInput!) {
  searchHikeByRadius(params: $params)
}
    ''';

    return searchEntityByRadius(input, query, 'searchHikeByRadius');
  }

  @override
  getTrack(String id) async {
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
  searchTrackByContent(SearchByContentInput input) async {
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
  Future<List<String>> getRandomTracks(int limit) async {
    const String query = r'''
       query Query($limit: Int!) {
          getRandomHikes(limit: $limit) 
       }
    ''';
    return executeEntityIdQuery(query, 'getRandomHikes', {'limit': limit},
        disableCache: true);
  }

  Future<List<PoiEntity>> _getRoutePois(String id, String routeLabel) async {
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
          .map((entity) => PoiEntity.fromJson(entity))
          .toList();
    } else {
      throw "$routeLabel of hike $id cannot be found.";
    }
  }
}
