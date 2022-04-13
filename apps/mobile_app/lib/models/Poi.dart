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
  final double? _elevation;
  final Location? _location;
  final List<String>? _types;
  final List<TextualDescription>? _description;
  final List<String>? _tags;
  final PoiSourceObject? _sourceObject;
  final String? _address;
  final String? _phoneNumber;
  final String? _openingHours;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  double? get elevation {
    return _elevation;
  }
  
  Location get location {
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
  
  List<TextualDescription>? get description {
    return _description;
  }
  
  List<String>? get tags {
    return _tags;
  }
  
  PoiSourceObject? get sourceObject {
    return _sourceObject;
  }
  
  String? get address {
    return _address;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
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
  
  const Poi._internal({required this.id, elevation, required location, types, description, tags, sourceObject, address, phoneNumber, openingHours, createdAt, updatedAt}): _elevation = elevation, _location = location, _types = types, _description = description, _tags = tags, _sourceObject = sourceObject, _address = address, _phoneNumber = phoneNumber, _openingHours = openingHours, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Poi({String? id, double? elevation, required Location location, List<String>? types, List<TextualDescription>? description, List<String>? tags, PoiSourceObject? sourceObject, String? address, String? phoneNumber, String? openingHours}) {
    return Poi._internal(
      id: id == null ? UUID.getUUID() : id,
      elevation: elevation,
      location: location,
      types: types != null ? List<String>.unmodifiable(types) : types,
      description: description != null ? List<TextualDescription>.unmodifiable(description) : description,
      tags: tags != null ? List<String>.unmodifiable(tags) : tags,
      sourceObject: sourceObject,
      address: address,
      phoneNumber: phoneNumber,
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
      _elevation == other._elevation &&
      _location == other._location &&
      DeepCollectionEquality().equals(_types, other._types) &&
      DeepCollectionEquality().equals(_description, other._description) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      _sourceObject == other._sourceObject &&
      _address == other._address &&
      _phoneNumber == other._phoneNumber &&
      _openingHours == other._openingHours;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Poi {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("elevation=" + (_elevation != null ? _elevation!.toString() : "null") + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("types=" + (_types != null ? _types!.toString() : "null") + ", ");
    buffer.write("description=" + (_description != null ? _description!.toString() : "null") + ", ");
    buffer.write("tags=" + (_tags != null ? _tags!.toString() : "null") + ", ");
    buffer.write("sourceObject=" + (_sourceObject != null ? _sourceObject!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("openingHours=" + "$_openingHours" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Poi copyWith({String? id, double? elevation, Location? location, List<String>? types, List<TextualDescription>? description, List<String>? tags, PoiSourceObject? sourceObject, String? address, String? phoneNumber, String? openingHours}) {
    return Poi._internal(
      id: id ?? this.id,
      elevation: elevation ?? this.elevation,
      location: location ?? this.location,
      types: types ?? this.types,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      sourceObject: sourceObject ?? this.sourceObject,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      openingHours: openingHours ?? this.openingHours);
  }
  
  Poi.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _elevation = (json['elevation'] as num?)?.toDouble(),
      _location = json['location']?['serializedData'] != null
        ? Location.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
        : null,
      _types = json['types']?.cast<String>(),
      _description = json['description'] is List
        ? (json['description'] as List)
          .where((e) => e != null)
          .map((e) => TextualDescription.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tags = json['tags']?.cast<String>(),
      _sourceObject = json['sourceObject']?['serializedData'] != null
        ? PoiSourceObject.fromJson(new Map<String, dynamic>.from(json['sourceObject']['serializedData']))
        : null,
      _address = json['address'],
      _phoneNumber = json['phoneNumber'],
      _openingHours = json['openingHours'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'elevation': _elevation, 'location': _location?.toJson(), 'types': _types, 'description': _description?.map((TextualDescription? e) => e?.toJson()).toList(), 'tags': _tags, 'sourceObject': _sourceObject?.toJson(), 'address': _address, 'phoneNumber': _phoneNumber, 'openingHours': _openingHours, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "poi.id");
  static final QueryField ELEVATION = QueryField(fieldName: "elevation");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField TYPES = QueryField(fieldName: "types");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField SOURCEOBJECT = QueryField(fieldName: "sourceObject");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField OPENINGHOURS = QueryField(fieldName: "openingHours");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Poi";
    modelSchemaDefinition.pluralName = "Pois";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        provider: AuthRuleProvider.IAM,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.ELEVATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Location')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.TYPES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'description',
      isRequired: false,
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
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'PoiSourceObject')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Poi.PHONENUMBER,
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