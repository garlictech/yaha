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


/** This is an auto generated class representing the Settings type in your schema. */
@immutable
class Settings {
  final int? _averageSpeed;
  final LengthUnit? _lengthUnit;

  int? get averageSpeed {
    return _averageSpeed;
  }
  
  LengthUnit? get lengthUnit {
    return _lengthUnit;
  }
  
  const Settings._internal({averageSpeed, lengthUnit}): _averageSpeed = averageSpeed, _lengthUnit = lengthUnit;
  
  factory Settings({int? averageSpeed, LengthUnit? lengthUnit}) {
    return Settings._internal(
      averageSpeed: averageSpeed,
      lengthUnit: lengthUnit);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
      _averageSpeed == other._averageSpeed &&
      _lengthUnit == other._lengthUnit;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Settings {");
    buffer.write("averageSpeed=" + (_averageSpeed != null ? _averageSpeed!.toString() : "null") + ", ");
    buffer.write("lengthUnit=" + (_lengthUnit != null ? enumToString(_lengthUnit)! : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Settings copyWith({int? averageSpeed, LengthUnit? lengthUnit}) {
    return Settings._internal(
      averageSpeed: averageSpeed ?? this.averageSpeed,
      lengthUnit: lengthUnit ?? this.lengthUnit);
  }
  
  Settings.fromJson(Map<String, dynamic> json)  
    : _averageSpeed = (json['averageSpeed'] as num?)?.toInt(),
      _lengthUnit = enumFromString<LengthUnit>(json['lengthUnit'], LengthUnit.values);
  
  Map<String, dynamic> toJson() => {
    'averageSpeed': _averageSpeed, 'lengthUnit': enumToString(_lengthUnit)
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Settings";
    modelSchemaDefinition.pluralName = "Settings";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'averageSpeed',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'lengthUnit',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
  });
}