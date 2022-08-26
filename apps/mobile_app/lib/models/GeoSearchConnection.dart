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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the GeoSearchConnection type in your schema. */
@immutable
class GeoSearchConnection {
  final List<String>? _items;
  final String? _nextToken;
  final int? _total;

  List<String>? get items {
    return _items;
  }
  
  String? get nextToken {
    return _nextToken;
  }
  
  int? get total {
    return _total;
  }
  
  const GeoSearchConnection._internal({items, nextToken, total}): _items = items, _nextToken = nextToken, _total = total;
  
  factory GeoSearchConnection({List<String>? items, String? nextToken, int? total}) {
    return GeoSearchConnection._internal(
      items: items != null ? List<String>.unmodifiable(items) : items,
      nextToken: nextToken,
      total: total);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeoSearchConnection &&
      DeepCollectionEquality().equals(_items, other._items) &&
      _nextToken == other._nextToken &&
      _total == other._total;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GeoSearchConnection {");
    buffer.write("items=" + (_items != null ? _items!.toString() : "null") + ", ");
    buffer.write("nextToken=" + "$_nextToken" + ", ");
    buffer.write("total=" + (_total != null ? _total!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GeoSearchConnection copyWith({List<String>? items, String? nextToken, int? total}) {
    return GeoSearchConnection._internal(
      items: items ?? this.items,
      nextToken: nextToken ?? this.nextToken,
      total: total ?? this.total);
  }
  
  GeoSearchConnection.fromJson(Map<String, dynamic> json)  
    : _items = json['items']?.cast<String>(),
      _nextToken = json['nextToken'],
      _total = (json['total'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'items': _items, 'nextToken': _nextToken, 'total': _total
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GeoSearchConnection";
    modelSchemaDefinition.pluralName = "GeoSearchConnections";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'items',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'nextToken',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'total',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}