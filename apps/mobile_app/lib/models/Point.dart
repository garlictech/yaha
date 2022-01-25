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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Point type in your schema. */
@immutable
class Point {
  final double? _lat;
  final double? _lon;
  final double? _ele;

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
  
  double? get ele {
    return _ele;
  }
  
  const Point._internal({required lat, required lon, ele}): _lat = lat, _lon = lon, _ele = ele;
  
  factory Point({required double lat, required double lon, double? ele}) {
    return Point._internal(
      lat: lat,
      lon: lon,
      ele: ele);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Point &&
      _lat == other._lat &&
      _lon == other._lon &&
      _ele == other._ele;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Point {");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lon=" + (_lon != null ? _lon!.toString() : "null") + ", ");
    buffer.write("ele=" + (_ele != null ? _ele!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Point copyWith({double? lat, double? lon, double? ele}) {
    return Point._internal(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      ele: ele ?? this.ele);
  }
  
  Point.fromJson(Map<String, dynamic> json)  
    : _lat = (json['lat'] as num?)?.toDouble(),
      _lon = (json['lon'] as num?)?.toDouble(),
      _ele = (json['ele'] as num?)?.toDouble();
  
  Map<String, dynamic> toJson() => {
    'lat': _lat, 'lon': _lon, 'ele': _ele
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Point";
    modelSchemaDefinition.pluralName = "Points";
    
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
      fieldName: 'ele',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
  });
}