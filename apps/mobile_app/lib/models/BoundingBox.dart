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


/** This is an auto generated class representing the BoundingBox type in your schema. */
@immutable
class BoundingBox {
  final Point? _NorthEast;
  final Point? _SouthWest;

  Point get NorthEast {
    try {
      return _NorthEast!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  Point get SouthWest {
    try {
      return _SouthWest!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  const BoundingBox._internal({required NorthEast, required SouthWest}): _NorthEast = NorthEast, _SouthWest = SouthWest;
  
  factory BoundingBox({required Point NorthEast, required Point SouthWest}) {
    return BoundingBox._internal(
      NorthEast: NorthEast,
      SouthWest: SouthWest);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoundingBox &&
      _NorthEast == other._NorthEast &&
      _SouthWest == other._SouthWest;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BoundingBox {");
    buffer.write("NorthEast=" + (_NorthEast != null ? _NorthEast!.toString() : "null") + ", ");
    buffer.write("SouthWest=" + (_SouthWest != null ? _SouthWest!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BoundingBox copyWith({Point? NorthEast, Point? SouthWest}) {
    return BoundingBox._internal(
      NorthEast: NorthEast ?? this.NorthEast,
      SouthWest: SouthWest ?? this.SouthWest);
  }
  
  BoundingBox.fromJson(Map<String, dynamic> json)  
    : _NorthEast = json['NorthEast']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['NorthEast']['serializedData']))
        : null,
      _SouthWest = json['SouthWest']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['SouthWest']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'NorthEast': _NorthEast?.toJson(), 'SouthWest': _SouthWest?.toJson()
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BoundingBox";
    modelSchemaDefinition.pluralName = "BoundingBoxes";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'NorthEast',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'SouthWest',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
  });
}