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
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Hike type in your schema. */
@immutable
class Hike extends Model {
  static const classType = const _HikeModelType();
  final String id;
  final List<TextualDescription>? _description;
  final String? _location;
  final PublicationState? _publicationState;
  final bool? _featured;
  final String? _rate;
  final String? _offlineMap;
  final List<HikeStop>? _featuredStops;
  final List<Poi>? _checkpoints;
  final List<String>? _tags;
  final RouteData? _route;
  final Point? _startPoint;
  final Point? _endPoint;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<TextualDescription> get description {
    try {
      return _description!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get location {
    try {
      return _location!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  PublicationState get publicationState {
    try {
      return _publicationState!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  bool? get featured {
    return _featured;
  }
  
  String? get rate {
    return _rate;
  }
  
  String? get offlineMap {
    return _offlineMap;
  }
  
  List<HikeStop>? get featuredStops {
    return _featuredStops;
  }
  
  List<Poi>? get checkpoints {
    return _checkpoints;
  }
  
  List<String>? get tags {
    return _tags;
  }
  
  RouteData get route {
    try {
      return _route!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  Point get startPoint {
    try {
      return _startPoint!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  Point get endPoint {
    try {
      return _endPoint!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Hike._internal({required this.id, required description, required location, required publicationState, featured, rate, offlineMap, featuredStops, checkpoints, tags, required route, required startPoint, required endPoint}): _description = description, _location = location, _publicationState = publicationState, _featured = featured, _rate = rate, _offlineMap = offlineMap, _featuredStops = featuredStops, _checkpoints = checkpoints, _tags = tags, _route = route, _startPoint = startPoint, _endPoint = endPoint;
  
  factory Hike({String? id, required List<TextualDescription> description, required String location, required PublicationState publicationState, bool? featured, String? rate, String? offlineMap, List<HikeStop>? featuredStops, List<Poi>? checkpoints, List<String>? tags, required RouteData route, required Point startPoint, required Point endPoint}) {
    return Hike._internal(
      id: id == null ? UUID.getUUID() : id,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description,
      location: location,
      publicationState: publicationState,
      featured: featured,
      rate: rate,
      offlineMap: offlineMap,
      featuredStops: featuredStops != null ? List<HikeStop>.unmodifiable(featuredStops) : featuredStops,
      checkpoints: checkpoints != null ? List<Poi>.unmodifiable(checkpoints) : checkpoints,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags,
      route: route,
      startPoint: startPoint,
      endPoint: endPoint);
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
      _location == other._location &&
      _publicationState == other._publicationState &&
      _featured == other._featured &&
      _rate == other._rate &&
      _offlineMap == other._offlineMap &&
      DeepCollectionEquality().equals(_featuredStops, other._featuredStops) &&
      DeepCollectionEquality().equals(_checkpoints, other._checkpoints) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      _route == other._route &&
      _startPoint == other._startPoint &&
      _endPoint == other._endPoint;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Hike {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + (_description != null ? _description!.toString() : "null") + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("publicationState=" + (_publicationState != null ? enumToString(_publicationState)! : "null") + ", ");
    buffer.write("featured=" + (_featured != null ? _featured!.toString() : "null") + ", ");
    buffer.write("rate=" + "$_rate" + ", ");
    buffer.write("offlineMap=" + "$_offlineMap" + ", ");
    buffer.write("featuredStops=" + (_featuredStops != null ? _featuredStops!.toString() : "null") + ", ");
    buffer.write("checkpoints=" + (_checkpoints != null ? _checkpoints!.toString() : "null") + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("route=" + (_route != null ? _route!.toString() : "null") + ", ");
    buffer.write("startPoint=" + (_startPoint != null ? _startPoint!.toString() : "null") + ", ");
    buffer.write("endPoint=" + (_endPoint != null ? _endPoint!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Hike copyWith({String? id, List<TextualDescription>? description, String? location, PublicationState? publicationState, bool? featured, String? rate, String? offlineMap, List<HikeStop>? featuredStops, List<Poi>? checkpoints, List<String>? tags, RouteData? route, Point? startPoint, Point? endPoint}) {
    return Hike(
      id: id ?? this.id,
      description: description ?? this.description,
      location: location ?? this.location,
      publicationState: publicationState ?? this.publicationState,
      featured: featured ?? this.featured,
      rate: rate ?? this.rate,
      offlineMap: offlineMap ?? this.offlineMap,
      featuredStops: featuredStops ?? this.featuredStops,
      checkpoints: checkpoints ?? this.checkpoints,
      tags: tags ?? this.tags,
      route: route ?? this.route,
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint);
  }
  
  Hike.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description']?.cast<TextualDescription>(),
      _location = json['location'],
      _publicationState = enumFromString<PublicationState>(json['publicationState'], PublicationState.values),
      _featured = json['featured'],
      _rate = json['rate'],
      _offlineMap = json['offlineMap'],
      _featuredStops = json['featuredStops']?.cast<HikeStop>(),
      _checkpoints = json['checkpoints']?.cast<Poi>(),
      _tags = json['tags']?.cast<String>(),
      _route = json['route'],
      _startPoint = json['startPoint'],
      _endPoint = json['endPoint'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'location': _location, 'publicationState': enumToString(_publicationState), 'featured': _featured, 'rate': _rate, 'offlineMap': _offlineMap, 'featuredStops': _featuredStops, 'checkpoints': _checkpoints, 'tags': _tags, 'route': _route, 'startPoint': _startPoint, 'endPoint': _endPoint
  };

  static final QueryField ID = QueryField(fieldName: "hike.id");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField PUBLICATIONSTATE = QueryField(fieldName: "publicationState");
  static final QueryField FEATURED = QueryField(fieldName: "featured");
  static final QueryField RATE = QueryField(fieldName: "rate");
  static final QueryField OFFLINEMAP = QueryField(fieldName: "offlineMap");
  static final QueryField FEATUREDSTOPS = QueryField(fieldName: "featuredStops");
  static final QueryField CHECKPOINTS = QueryField(fieldName: "checkpoints");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField ROUTE = QueryField(fieldName: "route");
  static final QueryField STARTPOINT = QueryField(fieldName: "startPoint");
  static final QueryField ENDPOINT = QueryField(fieldName: "endPoint");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Hike";
    modelSchemaDefinition.pluralName = "Hikes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.DESCRIPTION,
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.LOCATION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.PUBLICATIONSTATE,
      isRequired: true,
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.OFFLINEMAP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.FEATUREDSTOPS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.CHECKPOINTS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.ROUTE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.STARTPOINT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.ENDPOINT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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