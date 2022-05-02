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


/** This is an auto generated class representing the Checkpoint type in your schema. */
@immutable
class Checkpoint {
  final String? _poiId;
  final Point? _point;

  String? get poiId {
    return _poiId;
  }
  
  Point? get point {
    return _point;
  }
  
  const Checkpoint._internal({poiId, point}): _poiId = poiId, _point = point;
  
  factory Checkpoint({String? poiId, Point? point}) {
    return Checkpoint._internal(
      poiId: poiId,
      point: point);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Checkpoint &&
      _poiId == other._poiId &&
      _point == other._point;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Checkpoint {");
    buffer.write("poiId=" + "$_poiId" + ", ");
    buffer.write("point=" + (_point != null ? _point!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Checkpoint copyWith({String? poiId, Point? point}) {
    return Checkpoint._internal(
      poiId: poiId ?? this.poiId,
      point: point ?? this.point);
  }
  
  Checkpoint.fromJson(Map<String, dynamic> json)  
    : _poiId = json['poiId'],
      _point = json['point']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['point']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'poiId': _poiId, 'point': _point?.toJson()
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Checkpoint";
    modelSchemaDefinition.pluralName = "Checkpoints";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'poiId',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'point',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
  });
}