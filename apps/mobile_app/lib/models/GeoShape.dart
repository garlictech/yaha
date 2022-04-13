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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the GeoShape type in your schema. */
@immutable
class GeoShape {
  final String? _type;
  final List<double>? _coordinates;

  String get type {
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
  
  List<double> get coordinates {
    try {
      return _coordinates!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const GeoShape._internal({required type, required coordinates}): _type = type, _coordinates = coordinates;
  
  factory GeoShape({required String type, required List<double> coordinates}) {
    return GeoShape._internal(
      type: type,
      coordinates: coordinates != null ? List<double>.unmodifiable(coordinates) : coordinates);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeoShape &&
      _type == other._type &&
      DeepCollectionEquality().equals(_coordinates, other._coordinates);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GeoShape {");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("coordinates=" + (_coordinates != null ? _coordinates!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GeoShape copyWith({String? type, List<double>? coordinates}) {
    return GeoShape._internal(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates);
  }
  
  GeoShape.fromJson(Map<String, dynamic> json)  
    : _type = json['type'],
      _coordinates = (json['coordinates'] as List?)?.map((e) => (e as num).toDouble()).toList();
  
  Map<String, dynamic> toJson() => {
    'type': _type, 'coordinates': _coordinates
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GeoShape";
    modelSchemaDefinition.pluralName = "GeoShapes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'coordinates',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.double))
    ));
  });
}