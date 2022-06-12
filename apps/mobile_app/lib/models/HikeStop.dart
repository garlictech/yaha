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


/** This is an auto generated class representing the HikeStop type in your schema. */
@immutable
class HikeStop {
  final String? _poiId;
  final List<TextualDescription>? _description;

  String get poiId {
    try {
      return _poiId!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<TextualDescription>? get description {
    return _description;
  }
  
  const HikeStop._internal({required poiId, description}): _poiId = poiId, _description = description;
  
  factory HikeStop({required String poiId, List<TextualDescription>? description}) {
    return HikeStop._internal(
      poiId: poiId,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HikeStop &&
      _poiId == other._poiId &&
      DeepCollectionEquality().equals(_description, other._description);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("HikeStop {");
    buffer.write("poiId=" + "$_poiId" + ", ");
    buffer.write("description=" + (_description != null ? _description!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  HikeStop copyWith({String? poiId, List<TextualDescription>? description}) {
    return HikeStop._internal(
      poiId: poiId ?? this.poiId,
      description: description ?? this.description);
  }
  
  HikeStop.fromJson(Map<String, dynamic> json)  
    : _poiId = json['poiId'],
      _description = json['description'] is List
        ? (json['description'] as List)
          .where((e) => e != null)
          .map((e) => TextualDescription.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'poiId': _poiId, 'description': _description?.map((TextualDescription? e) => e?.toJson()).toList()
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "HikeStop";
    modelSchemaDefinition.pluralName = "HikeStops";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'poiId',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'description',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'TextualDescription')
    ));
  });
}