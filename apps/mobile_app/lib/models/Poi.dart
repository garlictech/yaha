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


/** This is an auto generated class representing the Poi type in your schema. */
@immutable
class Poi extends Model {
  static const classType = const _PoiModelType();
  final String id;
  final Point? _location;
  final List<String>? _types;
  final List<TextualDescription>? _description;
  final List<String>? _tags;
  final List<PoiSourceObject>? _sourceObject;
  final String? _address;
  final String? _phoneFloat;
  final String? _openingHours;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Point get location {
    try {
      return _location!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<String>? get types {
    return _types;
  }
  
  List<TextualDescription> get description {
    try {
      return _description!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<String>? get tags {
    return _tags;
  }
  
  List<PoiSourceObject> get sourceObject {
    try {
      return _sourceObject!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  String? get address {
    return _address;
  }
  
  String? get phoneFloat {
    return _phoneFloat;
  }
  
  String? get openingHours {
    return _openingHours;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Poi._internal({required this.id, required location, types, required description, tags, required sourceObject, address, phoneFloat, openingHours, createdAt, updatedAt}): _location = location, _types = types, _description = description, _tags = tags, _sourceObject = sourceObject, _address = address, _phoneFloat = phoneFloat, _openingHours = openingHours, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Poi({String? id, required Point location, List<String>? types, required List<TextualDescription> description, List<String>? tags, required List<PoiSourceObject> sourceObject, String? address, String? phoneFloat, String? openingHours}) {
    return Poi._internal(
      id: id == null ? UUID.getUUID() : id,
      location: location,
      types: types != null ? List<String>.unmodifiable(types) : types,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags,
      sourceObject: sourceObject != null ? List<PoiSourceObject>.unmodifiable(sourceObject) : sourceObject,
      address: address,
      phoneFloat: phoneFloat,
      openingHours: openingHours);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Poi &&
      id == other.id &&
      _location == other._location &&
      DeepCollectionEquality().equals(_types, other._types) &&
      DeepCollectionEquality().equals(_description, other._description) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      DeepCollectionEquality().equals(_sourceObject, other._sourceObject) &&
      _address == other._address &&
      _phoneFloat == other._phoneFloat &&
      _openingHours == other._openingHours;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Poi {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("types=" + (_types != null ? _types!.toString() : "null") + ", ");
    buffer.write("description=" + (_description != null ? _description!.toString() : "null") + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("sourceObject=" + (_sourceObject != null ? _sourceObject!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("phoneFloat=" + "$_phoneFloat" + ", ");
    buffer.write("openingHours=" + "$_openingHours" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Poi copyWith({String? id, Point? location, List<String>? types, List<TextualDescription>? description, List<String>? tags, List<PoiSourceObject>? sourceObject, String? address, String? phoneFloat, String? openingHours}) {
    return Poi._internal(
      id: id ?? this.id,
      location: location ?? this.location,
      types: types ?? this.types,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      sourceObject: sourceObject ?? this.sourceObject,
      address: address ?? this.address,
      phoneFloat: phoneFloat ?? this.phoneFloat,
      openingHours: openingHours ?? this.openingHours);
  }
  
  Poi.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _location = json['location']?['serializedData'] != null
        ? Point.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
        : null,
      _types = json['types']?.cast<String>(),
      _description = json['description'] is List
        ? (json['description'] as List)
          .where((e) => e != null)
          .map((e) => TextualDescription.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tags = json['tags']?.cast<String>(),
      _sourceObject = json['sourceObject'] is List
        ? (json['sourceObject'] as List)
          .where((e) => e != null)
          .map((e) => PoiSourceObject.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _address = json['address'],
      _phoneFloat = json['phoneFloat'],
      _openingHours = json['openingHours'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'location': _location?.toJson(), 'types': _types, 'description': _description?.map((TextualDescription? e) => e?.toJson()).toList(), 'tags': _tags, 'sourceObject': _sourceObject?.map((PoiSourceObject? e) => e?.toJson()).toList(), 'address': _address, 'phoneFloat': _phoneFloat, 'openingHours': _openingHours, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "poi.id");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField TYPES = QueryField(fieldName: "types");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField SOURCEOBJECT = QueryField(fieldName: "sourceObject");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField PHONEFLOAT = QueryField(fieldName: "phoneFloat");
  static final QueryField OPENINGHOURS = QueryField(fieldName: "openingHours");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Poi";
    modelSchemaDefinition.pluralName = "Pois";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Point')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.TYPES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'description',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'TextualDescription')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.TAGS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'sourceObject',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'PoiSourceObject')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.PHONEFLOAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.OPENINGHOURS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PoiModelType extends ModelType<Poi> {
  const _PoiModelType();
  
  @override
  Poi fromJson(Map<String, dynamic> jsonData) {
    return Poi.fromJson(jsonData);
  }
}