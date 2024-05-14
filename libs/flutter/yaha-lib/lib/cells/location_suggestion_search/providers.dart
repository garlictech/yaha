import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/location_suggestion_search.service.dart';
import 'infra/osm_location_suggestion_search.service.dart';

final locationSuggestionSearchProvider =
    Provider<LocationSuggestionSearch>((ref) => OsmLocationSuggestionSearch());
