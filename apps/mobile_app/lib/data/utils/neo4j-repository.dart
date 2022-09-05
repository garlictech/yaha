import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:yaha/domain/domain.dart';

import '../repositories/graphql_client.dart';
import 'cache/cache.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class RepositoryNeo4j<T> {
  late final GraphQLClient client;
  final _entityCache = DataCache();
  final FromJson fromJson;

  RepositoryNeo4j({required Ref ref, required this.fromJson}) {
    client = ref.read(graphqlClientProvider);
  }

  getEntityList(String query, String gqlLabel) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    final entities = result.data != null
        ? result.data![gqlLabel].map<T>((entity) => fromJson(entity)).toList()
        : const [];

    entities.forEach((entity) => _entityCache.addData(entity.id, entity));
    return entities;
  }

  searchEntityByRadius(
      SearchByRadiusInput input, String query, String gqlLabel) async {
    final params = {"params": input.toJson()};
    return _executeEntityIdQuery(query, gqlLabel, params);
  }

  getEntity(String query, String id, String gqlLabel) async {
    if (_entityCache.containsKey(id)) {
      return _entityCache.getData(id);
    }

    final QueryOptions options =
        QueryOptions(document: gql(query), variables: <String, dynamic>{
      "where": {"id": id}
    });

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    final entityData = result.data?[gqlLabel]?[0];

    if (entityData != null) {
      final entity = fromJson(entityData);
      _entityCache.addData(id, entity);
      return entity;
    } else {
      return null;
    }
  }

  searchEntityByContent(
      SearchByContentInput input, String query, String gqlLabel) async {
    final variables = {
      "where": {
        "descriptions_SOME": {
          "OR": [
            {
              "title_CONTAINS": input.content,
            },
            {
              "summary_CONTAINS": input.content,
            }
          ]
        }
      }
    };

    return _executeEntityIdQuery(query, gqlLabel, variables);
  }

  Future<List<String>> _executeEntityIdQuery(String query,
      String resultPropName, Map<String, dynamic>? variables) async {
    final QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? {});
    debugPrint('****1 $variables');
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }
    debugPrint('****2 ${result.data![resultPropName]}');
    final List<String> entityIds =
        result.data != null ? (result.data![resultPropName]) : const [];

    debugPrint('****2.5 ${entityIds.runtimeType}');
    debugPrint('****3 $entityIds');
    return entityIds;
  }
}
