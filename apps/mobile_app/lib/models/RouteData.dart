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


/** This is an auto generated class representing the RouteData type in your schema. */
@immutable
class RouteData {
  final int? _distance;
  final int? _uphill;
  final int? _downhill;
  final List<double>? _track;
  final List<double>? _bigBuffer;
  final List<double>? _smallBuffer;
  final int? _averageTime;
  final int? _score;
  final int? _difficulty;
  final BoundingBox? _bounds;
  final bool? _isRoundTrip;
  final BoundingBox? _poiSearchBox;

  int get distance {
    try {
      return _distance!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  int get uphill {
    try {
      return _uphill!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  int get downhill {
    try {
      return _downhill!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<double> get track {
    try {
      return _track!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<double> get bigBuffer {
    try {
      return _bigBuffer!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  List<double> get smallBuffer {
    try {
      return _smallBuffer!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  int get averageTime {
    try {
      return _averageTime!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  int get score {
    try {
      return _score!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  int get difficulty {
    try {
      return _difficulty!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  BoundingBox get bounds {
    try {
      return _bounds!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  bool get isRoundTrip {
    try {
      return _isRoundTrip!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  BoundingBox get poiSearchBox {
    try {
      return _poiSearchBox!;
    } catch(e) {
      throw new DataStoreException(
      DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
      recoverySuggestion:
        DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
      underlyingException: e.toString()
    );
    }
  }
  
  const RouteData._internal({required distance, required uphill, required downhill, required track, required bigBuffer, required smallBuffer, required averageTime, required score, required difficulty, required bounds, required isRoundTrip, required poiSearchBox}): _distance = distance, _uphill = uphill, _downhill = downhill, _track = track, _bigBuffer = bigBuffer, _smallBuffer = smallBuffer, _averageTime = averageTime, _score = score, _difficulty = difficulty, _bounds = bounds, _isRoundTrip = isRoundTrip, _poiSearchBox = poiSearchBox;
  
  factory RouteData({required int distance, required int uphill, required int downhill, required List<double> track, required List<double> bigBuffer, required List<double> smallBuffer, required int averageTime, required int score, required int difficulty, required BoundingBox bounds, required bool isRoundTrip, required BoundingBox poiSearchBox}) {
    return RouteData._internal(
      distance: distance,
      uphill: uphill,
      downhill: downhill,
      track: track != null ? List<double>.unmodifiable(track) : track,
      bigBuffer: bigBuffer != null ? List<double>.unmodifiable(bigBuffer) : bigBuffer,
      smallBuffer: smallBuffer != null ? List<double>.unmodifiable(smallBuffer) : smallBuffer,
      averageTime: averageTime,
      score: score,
      difficulty: difficulty,
      bounds: bounds,
      isRoundTrip: isRoundTrip,
      poiSearchBox: poiSearchBox);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RouteData &&
      _distance == other._distance &&
      _uphill == other._uphill &&
      _downhill == other._downhill &&
      DeepCollectionEquality().equals(_track, other._track) &&
      DeepCollectionEquality().equals(_bigBuffer, other._bigBuffer) &&
      DeepCollectionEquality().equals(_smallBuffer, other._smallBuffer) &&
      _averageTime == other._averageTime &&
      _score == other._score &&
      _difficulty == other._difficulty &&
      _bounds == other._bounds &&
      _isRoundTrip == other._isRoundTrip &&
      _poiSearchBox == other._poiSearchBox;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RouteData {");
    buffer.write("distance=" + (_distance != null ? _distance!.toString() : "null") + ", ");
    buffer.write("uphill=" + (_uphill != null ? _uphill!.toString() : "null") + ", ");
    buffer.write("downhill=" + (_downhill != null ? _downhill!.toString() : "null") + ", ");
    buffer.write("track=" + (_track != null ? _track!.toString() : "null") + ", ");
    buffer.write("bigBuffer=" + (_bigBuffer != null ? _bigBuffer!.toString() : "null") + ", ");
    buffer.write("smallBuffer=" + (_smallBuffer != null ? _smallBuffer!.toString() : "null") + ", ");
    buffer.write("averageTime=" + (_averageTime != null ? _averageTime!.toString() : "null") + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("difficulty=" + (_difficulty != null ? _difficulty!.toString() : "null") + ", ");
    buffer.write("bounds=" + (_bounds != null ? _bounds!.toString() : "null") + ", ");
    buffer.write("isRoundTrip=" + (_isRoundTrip != null ? _isRoundTrip!.toString() : "null") + ", ");
    buffer.write("poiSearchBox=" + (_poiSearchBox != null ? _poiSearchBox!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RouteData copyWith({int? distance, int? uphill, int? downhill, List<double>? track, List<double>? bigBuffer, List<double>? smallBuffer, int? averageTime, int? score, int? difficulty, BoundingBox? bounds, bool? isRoundTrip, BoundingBox? poiSearchBox}) {
    return RouteData._internal(
      distance: distance ?? this.distance,
      uphill: uphill ?? this.uphill,
      downhill: downhill ?? this.downhill,
      track: track ?? this.track,
      bigBuffer: bigBuffer ?? this.bigBuffer,
      smallBuffer: smallBuffer ?? this.smallBuffer,
      averageTime: averageTime ?? this.averageTime,
      score: score ?? this.score,
      difficulty: difficulty ?? this.difficulty,
      bounds: bounds ?? this.bounds,
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
      poiSearchBox: poiSearchBox ?? this.poiSearchBox);
  }
  
  RouteData.fromJson(Map<String, dynamic> json)  
    : _distance = (json['distance'] as num?)?.toInt(),
      _uphill = (json['uphill'] as num?)?.toInt(),
      _downhill = (json['downhill'] as num?)?.toInt(),
      _track = (json['track'] as List?)?.map((e) => (e as num).toDouble()).toList(),
      _bigBuffer = (json['bigBuffer'] as List?)?.map((e) => (e as num).toDouble()).toList(),
      _smallBuffer = (json['smallBuffer'] as List?)?.map((e) => (e as num).toDouble()).toList(),
      _averageTime = (json['averageTime'] as num?)?.toInt(),
      _score = (json['score'] as num?)?.toInt(),
      _difficulty = (json['difficulty'] as num?)?.toInt(),
      _bounds = json['bounds']?['serializedData'] != null
        ? BoundingBox.fromJson(new Map<String, dynamic>.from(json['bounds']['serializedData']))
        : null,
      _isRoundTrip = json['isRoundTrip'],
      _poiSearchBox = json['poiSearchBox']?['serializedData'] != null
        ? BoundingBox.fromJson(new Map<String, dynamic>.from(json['poiSearchBox']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'distance': _distance, 'uphill': _uphill, 'downhill': _downhill, 'track': _track, 'bigBuffer': _bigBuffer, 'smallBuffer': _smallBuffer, 'averageTime': _averageTime, 'score': _score, 'difficulty': _difficulty, 'bounds': _bounds?.toJson(), 'isRoundTrip': _isRoundTrip, 'poiSearchBox': _poiSearchBox?.toJson()
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RouteData";
    modelSchemaDefinition.pluralName = "RouteData";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'distance',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'uphill',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'downhill',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'track',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.double))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'bigBuffer',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.double))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'smallBuffer',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.double))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'averageTime',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'score',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'difficulty',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'bounds',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'BoundingBox')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'isRoundTrip',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'poiSearchBox',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'BoundingBox')
    ));
  });
}