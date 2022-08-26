/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Hike type in your schema. */
@immutable
class Hike extends Model {
  static const classType = const _HikeModelType();
  final String id;
  final List<TextualDescription>? _description;
  final LineString? _route;
  final PublicationState? _publicationState;
  final bool? _featured;
  final String? _rate;
  final List<HikeStopData>? _featuredStops;
  final List<Checkpoint>? _checkpoints;
  final List<String>? _tags;
  final String? _closestPlace;
  final Location? _location;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<TextualDescription>? get description {
    return _description;
  }
  
  LineString get route {
    try {
      return _route!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  PublicationState? get publicationState {
    return _publicationState;
  }
  
  bool? get featured {
    return _featured;
  }
  
  String? get rate {
    return _rate;
  }
  
  List<HikeStopData>? get featuredStops {
    return _featuredStops;
  }
  
  List<Checkpoint>? get checkpoints {
    return _checkpoints;
  }
  
  List<String>? get tags {
    return _tags;
  }
  
  String? get closestPlace {
    return _closestPlace;
  }
  
  Location? get location {
    return _location;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Hike._internal({required this.id, description, required route, publicationState, featured, rate, featuredStops, checkpoints, tags, closestPlace, location, createdAt, updatedAt}): _description = description, _route = route, _publicationState = publicationState, _featured = featured, _rate = rate, _featuredStops = featuredStops, _checkpoints = checkpoints, _tags = tags, _closestPlace = closestPlace, _location = location, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Hike({String? id, List<TextualDescription>? description, required LineString route, PublicationState? publicationState, bool? featured, String? rate, List<HikeStopData>? featuredStops, List<Checkpoint>? checkpoints, List<String>? tags, String? closestPlace, Location? location}) {
    return Hike._internal(
      id: id == null ? UUID.getUUID() : id,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description,
      route: route,
      publicationState: publicationState,
      featured: featured,
      rate: rate,
      featuredStops: featuredStops != null ? List<HikeStopData>.unmodifiable(featuredStops) : featuredStops,
      checkpoints: checkpoints != null ? List<Checkpoint>.unmodifiable(checkpoints) : checkpoints,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags,
      closestPlace: closestPlace,
      location: location);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Hike &&
      id == other.id &&
      DeepCollectionEquality().equals(_description, other._description) &&
      _route == other._route &&
      _publicationState == other._publicationState &&
      _featured == other._featured &&
      _rate == other._rate &&
      DeepCollectionEquality().equals(_featuredStops, other._featuredStops) &&
      DeepCollectionEquality().equals(_checkpoints, other._checkpoints) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      _closestPlace == other._closestPlace &&
      _location == other._location;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Hike {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + (_description != null ? _description!.toString() : "null") + ", ");
    buffer.write("route=" + (_route != null ? _route!.toString() : "null") + ", ");
    buffer.write("publicationState=" + (_publicationState != null ? enumToString(_publicationState)! : "null") + ", ");
    buffer.write("featured=" + (_featured != null ? _featured!.toString() : "null") + ", ");
    buffer.write("rate=" + "$_rate" + ", ");
    buffer.write("featuredStops=" + (_featuredStops != null ? _featuredStops!.toString() : "null") + ", ");
    buffer.write("checkpoints=" + (_checkpoints != null ? _checkpoints!.toString() : "null") + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("closestPlace=" + "$_closestPlace" + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Hike copyWith({String? id, List<TextualDescription>? description, LineString? route, PublicationState? publicationState, bool? featured, String? rate, List<HikeStopData>? featuredStops, List<Checkpoint>? checkpoints, List<String>? tags, String? closestPlace, Location? location}) {
    return Hike._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      route: route ?? this.route,
      publicationState: publicationState ?? this.publicationState,
      featured: featured ?? this.featured,
      rate: rate ?? this.rate,
      featuredStops: featuredStops ?? this.featuredStops,
      checkpoints: checkpoints ?? this.checkpoints,
      tags: tags ?? this.tags,
      closestPlace: closestPlace ?? this.closestPlace,
      location: location ?? this.location);
  }
  
  Hike.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'] is List
        ? (json['description'] as List)
          .where((e) => e != null)
          .map((e) => TextualDescription.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _route = json['route']?['serializedData'] != null
        ? LineString.fromJson(new Map<String, dynamic>.from(json['route']['serializedData']))
        : null,
      _publicationState = enumFromString<PublicationState>(json['publicationState'], PublicationState.values),
      _featured = json['featured'],
      _rate = json['rate'],
      _featuredStops = json['featuredStops'] is List
        ? (json['featuredStops'] as List)
          .where((e) => e != null)
          .map((e) => HikeStopData.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _checkpoints = json['checkpoints'] is List
        ? (json['checkpoints'] as List)
          .where((e) => e != null)
          .map((e) => Checkpoint.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tags = json['tags']?.cast<String>(),
      _closestPlace = json['closestPlace'],
      _location = json['location']?['serializedData'] != null
        ? Location.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description?.map((TextualDescription? e) => e?.toJson()).toList(), 'route': _route?.toJson(), 'publicationState': enumToString(_publicationState), 'featured': _featured, 'rate': _rate, 'featuredStops': _featuredStops?.map((HikeStopData? e) => e?.toJson()).toList(), 'checkpoints': _checkpoints?.map((Checkpoint? e) => e?.toJson()).toList(), 'tags': _tags, 'closestPlace': _closestPlace, 'location': _location?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "hike.id");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ROUTE = QueryField(fieldName: "route");
  static final QueryField PUBLICATIONSTATE = QueryField(fieldName: "publicationState");
  static final QueryField FEATURED = QueryField(fieldName: "featured");
  static final QueryField RATE = QueryField(fieldName: "rate");
  static final QueryField FEATUREDSTOPS = QueryField(fieldName: "featuredStops");
  static final QueryField CHECKPOINTS = QueryField(fieldName: "checkpoints");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField CLOSESTPLACE = QueryField(fieldName: "closestPlace");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Hike";
    modelSchemaDefinition.pluralName = "Hikes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        provider: AuthRuleProvider.IAM,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'description',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'TextualDescription')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'route',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'LineString')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.PUBLICATIONSTATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.FEATURED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.RATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'featuredStops',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'HikeStopData')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'checkpoints',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Checkpoint')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.CLOSESTPLACE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Location')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _HikeModelType extends ModelType<Hike> {
  const _HikeModelType();
  
  @override
  Hike fromJson(Map<String, dynamic> jsonData) {
    return Hike.fromJson(jsonData);
  }
}