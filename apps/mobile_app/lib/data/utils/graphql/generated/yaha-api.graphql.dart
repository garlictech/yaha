// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'yaha-api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GeoSearchConnection extends JsonSerializable with EquatableMixin {
  GeoSearchConnection();

  factory GeoSearchConnection.fromJson(Map<String, dynamic> json) =>
      _$GeoSearchConnectionFromJson(json);

  List<String>? items;

  String? nextToken;

  int? total;

  @override
  List<Object?> get props => [items, nextToken, total];
  @override
  Map<String, dynamic> toJson() => _$GeoSearchConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchAroundHike$Query extends JsonSerializable with EquatableMixin {
  SearchAroundHike$Query();

  factory SearchAroundHike$Query.fromJson(Map<String, dynamic> json) =>
      _$SearchAroundHike$QueryFromJson(json);

  GeoSearchConnection? searchAroundHike;

  @override
  List<Object?> get props => [searchAroundHike];
  @override
  Map<String, dynamic> toJson() => _$SearchAroundHike$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchAroundHikeInput extends JsonSerializable with EquatableMixin {
  SearchAroundHikeInput(
      {required this.hikeId,
      required this.distanceInMeters,
      required this.objectType,
      this.limit,
      this.nextToken});

  factory SearchAroundHikeInput.fromJson(Map<String, dynamic> json) =>
      _$SearchAroundHikeInputFromJson(json);

  late String hikeId;

  late double distanceInMeters;

  @JsonKey(unknownEnumValue: GeoSearchableObjectType.artemisUnknown)
  late GeoSearchableObjectType objectType;

  int? limit;

  String? nextToken;

  @override
  List<Object?> get props =>
      [hikeId, distanceInMeters, objectType, limit, nextToken];
  @override
  Map<String, dynamic> toJson() => _$SearchAroundHikeInputToJson(this);
}

enum GeoSearchableObjectType {
  @JsonValue('poi')
  poi,
  @JsonValue('hike')
  hike,
  @JsonValue('image')
  image,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class SearchAroundHikeArguments extends JsonSerializable with EquatableMixin {
  SearchAroundHikeArguments({required this.query});

  @override
  factory SearchAroundHikeArguments.fromJson(Map<String, dynamic> json) =>
      _$SearchAroundHikeArgumentsFromJson(json);

  late SearchAroundHikeInput query;

  @override
  List<Object?> get props => [query];
  @override
  Map<String, dynamic> toJson() => _$SearchAroundHikeArgumentsToJson(this);
}

final SEARCH_AROUND_HIKE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SearchAroundHike'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'query')),
            type: NamedTypeNode(
                name: NameNode(value: 'SearchAroundHikeInput'),
                isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'searchAroundHike'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'query'),
                  value: VariableNode(name: NameNode(value: 'query')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'items'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'nextToken'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'total'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class SearchAroundHikeQuery
    extends GraphQLQuery<SearchAroundHike$Query, SearchAroundHikeArguments> {
  SearchAroundHikeQuery({required this.variables});

  @override
  final DocumentNode document = SEARCH_AROUND_HIKE_QUERY_DOCUMENT;

  @override
  final String operationName = 'SearchAroundHike';

  @override
  final SearchAroundHikeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SearchAroundHike$Query parse(Map<String, dynamic> json) =>
      SearchAroundHike$Query.fromJson(json);
}
