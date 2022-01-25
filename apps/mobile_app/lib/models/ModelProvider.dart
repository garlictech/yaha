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
import 'Hike.dart';
import 'Poi.dart';
import 'BoundingBox.dart';
import 'HikeStop.dart';
import 'PoiSourceObject.dart';
import 'Point.dart';
import 'RouteData.dart';
import 'TextualDescription.dart';

export 'BoundingBox.dart';
export 'Hike.dart';
export 'HikeStop.dart';
export 'Poi.dart';
export 'PoiSource.dart';
export 'PoiSourceObject.dart';
export 'Point.dart';
export 'PublicationState.dart';
export 'RouteData.dart';
export 'TextualDescription.dart';
export 'TextualDescriptionType.dart';
export 'ValidDataLabels.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "058025b6dc42eaeaf68aa6fd609bb7cb";
  @override
  List<ModelSchema> modelSchemas = [Hike.schema, Poi.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [BoundingBox.schema, HikeStop.schema, PoiSourceObject.schema, Point.schema, RouteData.schema, TextualDescription.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Hike":
        return Hike.classType;
      case "Poi":
        return Poi.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}