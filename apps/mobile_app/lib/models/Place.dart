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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Place type in your schema. */
@immutable
class Place {
  final String id;
  final PlaceType? _type;
  final String? _objectId;
  final double? _lat;
  final double? _lon;
  final String? _title;
  final bool? _banned;
  final bool? _processed;

  PlaceType get type {
    try {
      return _type!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get objectId {
    try {
      return _objectId!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get lat {
    try {
      return _lat!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get lon {
    try {
      return _lon!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get title {
    return _title;
  }
  
  bool? get banned {
    return _banned;
  }
  
  bool? get processed {
    return _processed;
  }
  
  const Place._internal({required this.id, required type, required objectId, required lat, required lon, title, banned, processed}): _type = type, _objectId = objectId, _lat = lat, _lon = lon, _title = title, _banned = banned, _processed = processed;
  
  factory Place({String? id, required PlaceType type, required String objectId, required double lat, required double lon, String? title, bool? banned, bool? processed}) {
    return Place._internal(
      id: id == null ? UUID.getUUID() : id,
      type: type,
      objectId: objectId,
      lat: lat,
      lon: lon,
      title: title,
      banned: banned,
      processed: processed);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Place &&
      id == other.id &&
      _type == other._type &&
      _objectId == other._objectId &&
      _lat == other._lat &&
      _lon == other._lon &&
      _title == other._title &&
      _banned == other._banned &&
      _processed == other._processed;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Place {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null") + ", ");
    buffer.write("objectId=" + "$_objectId" + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lon=" + (_lon != null ? _lon!.toString() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("banned=" + (_banned != null ? _banned!.toString() : "null") + ", ");
    buffer.write("processed=" + (_processed != null ? _processed!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Place copyWith({String? id, PlaceType? type, String? objectId, double? lat, double? lon, String? title, bool? banned, bool? processed}) {
    return Place._internal(
      id: id ?? this.id,
      type: type ?? this.type,
      objectId: objectId ?? this.objectId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      title: title ?? this.title,
      banned: banned ?? this.banned,
      processed: processed ?? this.processed);
  }
  
  Place.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _type = enumFromString<PlaceType>(json['type'], PlaceType.values),
      _objectId = json['objectId'],
      _lat = (json['lat'] as num?)?.toDouble(),
      _lon = (json['lon'] as num?)?.toDouble(),
      _title = json['title'],
      _banned = json['banned'],
      _processed = json['processed'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'type': enumToString(_type), 'objectId': _objectId, 'lat': _lat, 'lon': _lon, 'title': _title, 'banned': _banned, 'processed': _processed
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Place";
    modelSchemaDefinition.pluralName = "Places";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'objectId',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'lat',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'lon',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'title',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'banned',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'processed',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}