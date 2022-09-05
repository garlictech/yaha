import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/utils/neo4j-repository.dart';
import 'package:yaha/domain/domain.dart';

class HikeRepositoryNeo4j extends RepositoryNeo4j<Hike>
    implements HikeRepository {
  HikeRepositoryNeo4j({required Ref ref})
      : super(ref: ref, fromJson: Hike.fromJson);

  @override
  getHikeList() async {
    const String query = r'''
    query Hikes {
      hikes {
        id
        route {
          id
          coordinates {
            location {
              latitude
              longitude
              height
            }  
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
        route {
          id
          coordinates {
            location {
              latitude
              longitude
              height  
            }
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

    return getEntity(query, id, 'hikes');
  }

  @override
  searchHikeByContent(SearchByContentInput input) async {
    const String query = r'''
    query Hikes($where: HikeWhere) {
      hikes(where: $where) {
        id
      }
    }
    ''';

    return searchEntityByContent(input, query, 'hikes');
  }
}
