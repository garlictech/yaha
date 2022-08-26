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
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TextualDescription type in your schema. */
@immutable
class TextualDescription {
  final String? _languageKey;
  final String? _title;
  final String? _summary;
  final String? _fullDescription;
  final TextualDescriptionType? _type;

  String get languageKey {
    try {
      return _languageKey!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get title {
    return _title;
  }
  
  String? get summary {
    return _summary;
  }
  
  String? get fullDescription {
    return _fullDescription;
  }
  
  TextualDescriptionType get type {
    try {
      return _type!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const TextualDescription._internal({required languageKey, title, summary, fullDescription, required type}): _languageKey = languageKey, _title = title, _summary = summary, _fullDescription = fullDescription, _type = type;
  
  factory TextualDescription({required String languageKey, String? title, String? summary, String? fullDescription, required TextualDescriptionType type}) {
    return TextualDescription._internal(
      languageKey: languageKey,
      title: title,
      summary: summary,
      fullDescription: fullDescription,
      type: type);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextualDescription &&
      _languageKey == other._languageKey &&
      _title == other._title &&
      _summary == other._summary &&
      _fullDescription == other._fullDescription &&
      _type == other._type;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TextualDescription {");
    buffer.write("languageKey=" + "$_languageKey" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("summary=" + "$_summary" + ", ");
    buffer.write("fullDescription=" + "$_fullDescription" + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TextualDescription copyWith({String? languageKey, String? title, String? summary, String? fullDescription, TextualDescriptionType? type}) {
    return TextualDescription._internal(
      languageKey: languageKey ?? this.languageKey,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      fullDescription: fullDescription ?? this.fullDescription,
      type: type ?? this.type);
  }
  
  TextualDescription.fromJson(Map<String, dynamic> json)  
    : _languageKey = json['languageKey'],
      _title = json['title'],
      _summary = json['summary'],
      _fullDescription = json['fullDescription'],
      _type = enumFromString<TextualDescriptionType>(json['type'], TextualDescriptionType.values);
  
  Map<String, dynamic> toJson() => {
    'languageKey': _languageKey, 'title': _title, 'summary': _summary, 'fullDescription': _fullDescription, 'type': enumToString(_type)
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TextualDescription";
    modelSchemaDefinition.pluralName = "TextualDescriptions";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'languageKey',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'title',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'summary',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'fullDescription',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
  });
}