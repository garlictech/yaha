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


/** This is an auto generated class representing the PoiSourceObject type in your schema. */
@immutable
class PoiSourceObject {
  final PoiSource? _objectType;
  final String? _languageKey;
  final String? _objectId;
  final String? _url;

  PoiSource get objectType {
    try {
      return _objectType!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  String? get languageKey {
    return _languageKey;
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
  
  String? get url {
    return _url;
  }
  
  const PoiSourceObject._internal({required objectType, languageKey, required objectId, url}): _objectType = objectType, _languageKey = languageKey, _objectId = objectId, _url = url;
  
  factory PoiSourceObject({required PoiSource objectType, String? languageKey, required String objectId, String? url}) {
    return PoiSourceObject._internal(
      objectType: objectType,
      languageKey: languageKey,
      objectId: objectId,
      url: url);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PoiSourceObject &&
      _objectType == other._objectType &&
      _languageKey == other._languageKey &&
      _objectId == other._objectId &&
      _url == other._url;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PoiSourceObject {");
    buffer.write("objectType=" + (_objectType != null ? enumToString(_objectType)! : "null") + ", ");
    buffer.write("languageKey=" + "$_languageKey" + ", ");
    buffer.write("objectId=" + "$_objectId" + ", ");
    buffer.write("url=" + "$_url");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PoiSourceObject copyWith({PoiSource? objectType, String? languageKey, String? objectId, String? url}) {
    return PoiSourceObject._internal(
      objectType: objectType ?? this.objectType,
      languageKey: languageKey ?? this.languageKey,
      objectId: objectId ?? this.objectId,
      url: url ?? this.url);
  }
  
  PoiSourceObject.fromJson(Map<String, dynamic> json)  
    : _objectType = enumFromString<PoiSource>(json['objectType'], PoiSource.values),
      _languageKey = json['languageKey'],
      _objectId = json['objectId'],
      _url = json['url'];
  
  Map<String, dynamic> toJson() => {
    'objectType': enumToString(_objectType), 'languageKey': _languageKey, 'objectId': _objectId, 'url': _url
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PoiSourceObject";
    modelSchemaDefinition.pluralName = "PoiSourceObjects";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'objectType',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'languageKey',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'objectId',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'url',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}