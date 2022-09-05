import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/utils/neo4j-repository.dart';
import 'package:yaha/domain/domain.dart';

class PoiRepositoryNeo4j extends RepositoryNeo4j<Poi> implements PoiRepository {
  PoiRepositoryNeo4j({required Ref ref})
      : super(ref: ref, fromJson: Poi.fromJson);

  @override
  searchPoiByRadius(SearchByRadiusInput input) async {
    const String query = r'''
query Query($params: SearchByRadiusInput!) {
  searchPoiByRadius(params: $params)
}
    ''';

    return searchEntityByRadius(input, query, 'searchPoiByRadius');
  }

  @override
  getPoi(String id) async {
    const String query = r'''
query Pois($where: PoiWhere) {
  pois(where: $where) {
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
  }
}''';

    return getEntity(query, id, 'pois');
  }

  @override
  searchPoiByContent(SearchByContentInput input) async {
    const String query = r'''
    query pois($where: PoiWhere) {
      pois(where: $where) {
        id
      }
    }
    ''';

    return searchEntityByContent(input, query, 'pois');
  }
}
