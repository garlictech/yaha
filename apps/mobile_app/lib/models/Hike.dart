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
  final bool? _featured;
  final String? _rate;
  final String? _offlineMap;
  final List<HikeStop>? _featuredStops;
  final List<String>? _tags;
  final RouteData? _route;
  final Point? _startPoint;
  final Point? _endPoint;
  final List<String>? _imageUrls;
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
  
  String? get location {
    return _location;
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
  
  List<String>? get tags {
    return _tags;
  }
  
  RouteData? get route {
    return _route;
  }
  
  Point? get startPoint {
    return _startPoint;
  }
  
  Point? get endPoint {
    return _endPoint;
  }
  
  List<String>? get imageUrls {
    return _imageUrls;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Hike._internal({required this.id, description, location, featured, rate, offlineMap, featuredStops, tags, route, startPoint, endPoint, imageUrls, createdAt, updatedAt}): _description = description, _location = location, _featured = featured, _rate = rate, _offlineMap = offlineMap, _featuredStops = featuredStops, _tags = tags, _route = route, _startPoint = startPoint, _endPoint = endPoint, _imageUrls = imageUrls, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Hike({String? id, List<TextualDescription>? description, String? location, bool? featured, String? rate, String? offlineMap, List<HikeStop>? featuredStops, List<String>? tags, RouteData? route, Point? startPoint, Point? endPoint, List<String>? imageUrls}) {
    return Hike._internal(
      id: id == null ? UUID.getUUID() : id,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description,
      location: location,
      featured: featured,
      rate: rate,
      offlineMap: offlineMap,
      featuredStops: featuredStops != null ? List<HikeStop>.unmodifiable(featuredStops) : featuredStops,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags,
      route: route,
      startPoint: startPoint,
      endPoint: endPoint,
      imageUrls: imageUrls != null ? List<String>.unmodifiable(imageUrls) : imageUrls);
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
      _featured == other._featured &&
      _rate == other._rate &&
      _offlineMap == other._offlineMap &&
      DeepCollectionEquality().equals(_featuredStops, other._featuredStops) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      _route == other._route &&
      _startPoint == other._startPoint &&
      _endPoint == other._endPoint &&
      DeepCollectionEquality().equals(_imageUrls, other._imageUrls);
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
    buffer.write("featured=" + (_featured != null ? _featured!.toString() : "null") + ", ");
    buffer.write("rate=" + "$_rate" + ", ");
    buffer.write("offlineMap=" + "$_offlineMap" + ", ");
    buffer.write("featuredStops=" + (_featuredStops != null ? _featuredStops!.toString() : "null") + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("route=" + (_route != null ? _route!.toString() : "null") + ", ");
    buffer.write("startPoint=" + (_startPoint != null ? _startPoint!.toString() : "null") + ", ");
    buffer.write("endPoint=" + (_endPoint != null ? _endPoint!.toString() : "null") + ", ");
    buffer.write("imageUrls=" + (_imageUrls != null ? _imageUrls!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Hike copyWith({String? id, List<TextualDescription>? description, String? location, bool? featured, String? rate, String? offlineMap, List<HikeStop>? featuredStops, List<String>? tags, RouteData? route, Point? startPoint, Point? endPoint, List<String>? imageUrls}) {
    return Hike._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      location: location ?? this.location,
      featured: featured ?? this.featured,
      rate: rate ?? this.rate,
      offlineMap: offlineMap ?? this.offlineMap,
      featuredStops: featuredStops ?? this.featuredStops,
      tags: tags ?? this.tags,
      route: route ?? this.route,
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      imageUrls: imageUrls ?? this.imageUrls);
  }
  
  Hike.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'] is List
        ? (json['description'] as List)
          .where((e) => e != null)
          .map((e) => TextualDescription.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _location = json['location'],
      _featured = json['featured'],
      _rate = json['rate'],
      _offlineMap = json['offlineMap'],
      _featuredStops = json['featuredStops'] is List
        ? (json['featuredStops'] as List)
          .where((e) => e != null)
          .map((e) => HikeStop.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tags = json['tags']?.cast<String>(),
      _route = json['route']?['serializedData'] != null
        ? RouteData.fromJson(new Map<String, dynamic>.from(json['route']['serializedData']))
        : null,
      _startPoint = json['startPoint']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['startPoint']['serializedData']))
        : null,
      _endPoint = json['endPoint']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['endPoint']['serializedData']))
        : null,
      _imageUrls = json['imageUrls']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description?.map((TextualDescription? e) => e?.toJson()).toList(), 'location': _location, 'featured': _featured, 'rate': _rate, 'offlineMap': _offlineMap, 'featuredStops': _featuredStops?.map((HikeStop? e) => e?.toJson()).toList(), 'tags': _tags, 'route': _route?.toJson(), 'startPoint': _startPoint?.toJson(), 'endPoint': _endPoint?.toJson(), 'imageUrls': _imageUrls, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "hike.id");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField FEATURED = QueryField(fieldName: "featured");
  static final QueryField RATE = QueryField(fieldName: "rate");
  static final QueryField OFFLINEMAP = QueryField(fieldName: "offlineMap");
  static final QueryField FEATUREDSTOPS = QueryField(fieldName: "featuredStops");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField ROUTE = QueryField(fieldName: "route");
  static final QueryField STARTPOINT = QueryField(fieldName: "startPoint");
  static final QueryField ENDPOINT = QueryField(fieldName: "endPoint");
  static final QueryField IMAGEURLS = QueryField(fieldName: "imageUrls");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Hike";
    modelSchemaDefinition.pluralName = "Hikes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'description',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'TextualDescription')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'featuredStops',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'HikeStop')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'route',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'RouteData')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'startPoint',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'endPoint',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Hike.IMAGEURLS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
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