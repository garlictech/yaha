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

    final x = searchEntityByRadius(input, query, 'searchHikeByRadius');
    return x;
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
          coordinates {
            location {
              longitude
              latitude
              height
            }
          }

          onroutePois {
            id
            type
            tags
            address
            phone
            openingHours
            infoUrl
            descriptions {
              languageKey
              title
              summary
              fullDescription
              type
            }
            images {
              original
              card
              thumbnail
            }
            location {
              location {
                longitude
                latitude
                height
              }
            }
          }
          offroutePois {
            id
            type
            tags
            address
            phone
            openingHours
            infoUrl
            descriptions {
              languageKey
              title
              summary
              fullDescription
              type
            }
            images {
              original
              card
              thumbnail
            }
            location {
              location {
                longitude
                latitude
                height
              }
            }
          }
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
    query Hikes($where: HikeWhere) {
      hikes(where: $where) {
        id
      }
    }
    ''';

    return searchEntityByContent(input, query, 'hikes');
  }
}
