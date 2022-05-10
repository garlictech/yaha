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


/** This is an auto generated class representing the Customer type in your schema. */
@immutable
class Customer {
  final Profile? _profile;
  final Settings? _settings;
  final List<String>? _bookmarkedHikes;

  Profile? get profile {
    return _profile;
  }
  
  Settings? get settings {
    return _settings;
  }
  
  List<String>? get bookmarkedHikes {
    return _bookmarkedHikes;
  }
  
  const Customer._internal({profile, settings, bookmarkedHikes}): _profile = profile, _settings = settings, _bookmarkedHikes = bookmarkedHikes;
  
  factory Customer({Profile? profile, Settings? settings, List<String>? bookmarkedHikes}) {
    return Customer._internal(
      profile: profile,
      settings: settings,
      bookmarkedHikes: bookmarkedHikes != null ? List<String>.unmodifiable(bookmarkedHikes) : bookmarkedHikes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
      _profile == other._profile &&
      _settings == other._settings &&
      DeepCollectionEquality().equals(_bookmarkedHikes, other._bookmarkedHikes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Customer {");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("settings=" + (_settings != null ? _settings!.toString() : "null") + ", ");
    buffer.write("bookmarkedHikes=" + (_bookmarkedHikes != null ? _bookmarkedHikes!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Customer copyWith({Profile? profile, Settings? settings, List<String>? bookmarkedHikes}) {
    return Customer._internal(
      profile: profile ?? this.profile,
      settings: settings ?? this.settings,
      bookmarkedHikes: bookmarkedHikes ?? this.bookmarkedHikes);
  }
  
  Customer.fromJson(Map<String, dynamic> json)  
    : _profile = json['profile']?['serializedData'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']['serializedData']))
        : null,
      _settings = json['settings']?['serializedData'] != null
        ? Settings.fromJson(new Map<String, dynamic>.from(json['settings']['serializedData']))
        : null,
      _bookmarkedHikes = json['bookmarkedHikes']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'profile': _profile?.toJson(), 'settings': _settings?.toJson(), 'bookmarkedHikes': _bookmarkedHikes
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Customer";
    modelSchemaDefinition.pluralName = "Customers";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'profile',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Profile')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'settings',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Settings')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'bookmarkedHikes',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}