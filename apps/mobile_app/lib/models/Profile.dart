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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Profile type in your schema. */
@immutable
class Profile {
  final String? _username;
  final String? _birthDate;
  final String? _firstName;
  final String? _lastName;
  final List<String>? _languages;
  final String? _picture;
  final String? _phone;

  String get username {
    try {
      return _username!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get birthDate {
    return _birthDate;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  List<String>? get languages {
    return _languages;
  }
  
  String? get picture {
    return _picture;
  }
  
  String? get phone {
    return _phone;
  }
  
  const Profile._internal({required username, birthDate, firstName, lastName, languages, picture, phone}): _username = username, _birthDate = birthDate, _firstName = firstName, _lastName = lastName, _languages = languages, _picture = picture, _phone = phone;
  
  factory Profile({required String username, String? birthDate, String? firstName, String? lastName, List<String>? languages, String? picture, String? phone}) {
    return Profile._internal(
      username: username,
      birthDate: birthDate,
      firstName: firstName,
      lastName: lastName,
      languages: languages != null ? List<String>.unmodifiable(languages) : languages,
      picture: picture,
      phone: phone);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      _username == other._username &&
      _birthDate == other._birthDate &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      DeepCollectionEquality().equals(_languages, other._languages) &&
      _picture == other._picture &&
      _phone == other._phone;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("birthDate=" + "$_birthDate" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("languages=" + (_languages != null ? _languages!.toString() : "null") + ", ");
    buffer.write("picture=" + "$_picture" + ", ");
    buffer.write("phone=" + "$_phone");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({String? username, String? birthDate, String? firstName, String? lastName, List<String>? languages, String? picture, String? phone}) {
    return Profile._internal(
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      languages: languages ?? this.languages,
      picture: picture ?? this.picture,
      phone: phone ?? this.phone);
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : _username = json['username'],
      _birthDate = json['birthDate'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _languages = json['languages']?.cast<String>(),
      _picture = json['picture'],
      _phone = json['phone'];
  
  Map<String, dynamic> toJson() => {
    'username': _username, 'birthDate': _birthDate, 'firstName': _firstName, 'lastName': _lastName, 'languages': _languages, 'picture': _picture, 'phone': _phone
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'username',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'birthDate',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'firstName',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'lastName',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'languages',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'picture',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'phone',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}