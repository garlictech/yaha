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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ImageInfo type in your schema. */
@immutable
class ImageInfo {
  final String? _url;
  final int? _width;
  final int? _height;

  String get url {
    try {
      return _url!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get width {
    return _width;
  }
  
  int? get height {
    return _height;
  }
  
  const ImageInfo._internal({required url, width, height}): _url = url, _width = width, _height = height;
  
  factory ImageInfo({required String url, int? width, int? height}) {
    return ImageInfo._internal(
      url: url,
      width: width,
      height: height);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageInfo &&
      _url == other._url &&
      _width == other._width &&
      _height == other._height;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ImageInfo {");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("width=" + (_width != null ? _width!.toString() : "null") + ", ");
    buffer.write("height=" + (_height != null ? _height!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ImageInfo copyWith({String? url, int? width, int? height}) {
    return ImageInfo._internal(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height);
  }
  
  ImageInfo.fromJson(Map<String, dynamic> json)  
    : _url = json['url'],
      _width = (json['width'] as num?)?.toInt(),
      _height = (json['height'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'url': _url, 'width': _width, 'height': _height
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ImageInfo";
    modelSchemaDefinition.pluralName = "ImageInfos";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'url',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'width',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'height',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}