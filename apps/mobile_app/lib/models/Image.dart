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


/** This is an auto generated class representing the Image type in your schema. */
@immutable
class Image extends Model {
  static const classType = const _ImageModelType();
  final String id;
  final Location? _location;
  final ImageInfo? _original;
  final ImageInfo? _card;
  final ImageInfo? _thumbnail;
  final PoiSourceObject? _sourceObject;
  final String? _attributions;
  final List<String>? _labels;
  final bool? _tagged;
  final bool? _banned;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
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
  
  ImageInfo get original {
    try {
      return _original!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  ImageInfo get card {
    try {
      return _card!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  ImageInfo get thumbnail {
    try {
      return _thumbnail!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  PoiSourceObject get sourceObject {
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
  
  String? get attributions {
    return _attributions;
  }
  
  List<String>? get labels {
    return _labels;
  }
  
  bool? get tagged {
    return _tagged;
  }
  
  bool? get banned {
    return _banned;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Image._internal({required this.id, required location, required original, required card, required thumbnail, required sourceObject, attributions, labels, tagged, banned, createdAt, updatedAt}): _location = location, _original = original, _card = card, _thumbnail = thumbnail, _sourceObject = sourceObject, _attributions = attributions, _labels = labels, _tagged = tagged, _banned = banned, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Image({String? id, required Location location, required ImageInfo original, required ImageInfo card, required ImageInfo thumbnail, required PoiSourceObject sourceObject, String? attributions, List<String>? labels, bool? tagged, bool? banned}) {
    return Image._internal(
      id: id == null ? UUID.getUUID() : id,
      location: location,
      original: original,
      card: card,
      thumbnail: thumbnail,
      sourceObject: sourceObject,
      attributions: attributions,
      labels: labels != null ? List<String>.unmodifiable(labels) : labels,
      tagged: tagged,
      banned: banned);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Image &&
      id == other.id &&
      _location == other._location &&
      _original == other._original &&
      _card == other._card &&
      _thumbnail == other._thumbnail &&
      _sourceObject == other._sourceObject &&
      _attributions == other._attributions &&
      DeepCollectionEquality().equals(_labels, other._labels) &&
      _tagged == other._tagged &&
      _banned == other._banned;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Image {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("original=" + (_original != null ? _original!.toString() : "null") + ", ");
    buffer.write("card=" + (_card != null ? _card!.toString() : "null") + ", ");
    buffer.write("thumbnail=" + (_thumbnail != null ? _thumbnail!.toString() : "null") + ", ");
    buffer.write("sourceObject=" + (_sourceObject != null ? _sourceObject!.toString() : "null") + ", ");
    buffer.write("attributions=" + "$_attributions" + ", ");
    buffer.write("labels=" + (_labels != null ? _labels!.toString() : "null") + ", ");
    buffer.write("tagged=" + (_tagged != null ? _tagged!.toString() : "null") + ", ");
    buffer.write("banned=" + (_banned != null ? _banned!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Image copyWith({String? id, Location? location, ImageInfo? original, ImageInfo? card, ImageInfo? thumbnail, PoiSourceObject? sourceObject, String? attributions, List<String>? labels, bool? tagged, bool? banned}) {
    return Image._internal(
      id: id ?? this.id,
      location: location ?? this.location,
      original: original ?? this.original,
      card: card ?? this.card,
      thumbnail: thumbnail ?? this.thumbnail,
      sourceObject: sourceObject ?? this.sourceObject,
      attributions: attributions ?? this.attributions,
      labels: labels ?? this.labels,
      tagged: tagged ?? this.tagged,
      banned: banned ?? this.banned);
  }
  
  Image.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _location = json['location']?['serializedData'] != null
        ? Location.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
        : null,
      _original = json['original']?['serializedData'] != null
        ? ImageInfo.fromJson(new Map<String, dynamic>.from(json['original']['serializedData']))
        : null,
      _card = json['card']?['serializedData'] != null
        ? ImageInfo.fromJson(new Map<String, dynamic>.from(json['card']['serializedData']))
        : null,
      _thumbnail = json['thumbnail']?['serializedData'] != null
        ? ImageInfo.fromJson(new Map<String, dynamic>.from(json['thumbnail']['serializedData']))
        : null,
      _sourceObject = json['sourceObject']?['serializedData'] != null
        ? PoiSourceObject.fromJson(new Map<String, dynamic>.from(json['sourceObject']['serializedData']))
        : null,
      _attributions = json['attributions'],
      _labels = json['labels']?.cast<String>(),
      _tagged = json['tagged'],
      _banned = json['banned'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'location': _location?.toJson(), 'original': _original?.toJson(), 'card': _card?.toJson(), 'thumbnail': _thumbnail?.toJson(), 'sourceObject': _sourceObject?.toJson(), 'attributions': _attributions, 'labels': _labels, 'tagged': _tagged, 'banned': _banned, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "image.id");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField ORIGINAL = QueryField(fieldName: "original");
  static final QueryField CARD = QueryField(fieldName: "card");
  static final QueryField THUMBNAIL = QueryField(fieldName: "thumbnail");
  static final QueryField SOURCEOBJECT = QueryField(fieldName: "sourceObject");
  static final QueryField ATTRIBUTIONS = QueryField(fieldName: "attributions");
  static final QueryField LABELS = QueryField(fieldName: "labels");
  static final QueryField TAGGED = QueryField(fieldName: "tagged");
  static final QueryField BANNED = QueryField(fieldName: "banned");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Image";
    modelSchemaDefinition.pluralName = "Images";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Location')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'original',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'ImageInfo')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'card',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'ImageInfo')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'thumbnail',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'ImageInfo')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'sourceObject',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'PoiSourceObject')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Image.ATTRIBUTIONS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Image.LABELS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Image.TAGGED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Image.BANNED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
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

class _ImageModelType extends ModelType<Image> {
  const _ImageModelType();
  
  @override
  Image fromJson(Map<String, dynamic> jsonData) {
    return Image.fromJson(jsonData);
  }
}