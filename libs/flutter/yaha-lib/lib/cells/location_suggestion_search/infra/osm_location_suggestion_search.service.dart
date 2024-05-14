import 'package:dartx/dartx.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../domain/location_suggestion_search.service.dart';
import '../domain/location_suggestion.dart';

class OsmLocationSuggestionSearch extends LocationSuggestionSearch {
  @override
  Future<List<LocationSuggestion>> search(String query) async {
    return addressSuggestion(query, limitInformation: 10).then((value) => value
        .filter((element) => element.address != null && element.point != null)
        .map((e) => LocationSuggestion(
            name: e.address.toString(),
            location:
                Location(lat: e.point!.latitude, lon: e.point!.longitude)))
        .toList());
  }
}
