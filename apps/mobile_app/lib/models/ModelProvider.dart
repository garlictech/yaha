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
import 'Image.dart';
import 'Poi.dart';
import 'BoundingBox.dart';
import 'Checkpoint.dart';
import 'Customer.dart';
import 'GeoSearchConnection.dart';
import 'GeoShape.dart';
import 'HikeStopData.dart';
import 'ImageInfo.dart';
import 'LineString.dart';
import 'Location.dart';
import 'PoiSourceObject.dart';
import 'Point.dart';
import 'Profile.dart';
import 'RouteData.dart';
import 'Settings.dart';
import 'TextualDescription.dart';

export 'BoundingBox.dart';
export 'Checkpoint.dart';
export 'Customer.dart';
export 'GeoSearchConnection.dart';
export 'GeoSearchableObjectType.dart';
export 'GeoShape.dart';
export 'Hike.dart';
export 'HikeStopData.dart';
export 'Image.dart';
export 'ImageInfo.dart';
export 'LengthUnit.dart';
export 'LineString.dart';
export 'Location.dart';
export 'PlaceType.dart';
export 'Poi.dart';
export 'PoiSource.dart';
export 'PoiSourceObject.dart';
export 'Point.dart';
export 'Profile.dart';
export 'PublicationState.dart';
export 'RouteData.dart';
export 'Settings.dart';
export 'TextualDescription.dart';
export 'TextualDescriptionType.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "5234eac4a5f56627b9af925b6893d202";
  @override
  List<ModelSchema> modelSchemas = [Hike.schema, Image.schema, Poi.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [BoundingBox.schema, Checkpoint.schema, Customer.schema, GeoSearchConnection.schema, GeoShape.schema, HikeStopData.schema, ImageInfo.schema, LineString.schema, Location.schema, PoiSourceObject.schema, Point.schema, Profile.schema, RouteData.schema, Settings.schema, TextualDescription.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Hike":
        return Hike.classType;
      case "Image":
        return Image.classType;
      case "Poi":
        return Poi.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}