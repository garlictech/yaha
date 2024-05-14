import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../domain/location_suggestion.dart';

class LocationSuggestionSearchController {
  final WidgetRef ref;

  LocationSuggestionSearchController({required this.ref});

  getSuggestions(String pattern) {
    return [];
    /* return places.searchByText(pattern).then((response) {
      return response.results;
    });*/
  }

  suggestionSelected(LocationSuggestion result) async {
    /*final location = result.geometry?.location;

    if (location != null) {
      await _getHikes(domain.Point(
          latitude: location.lat, longitude: location.lng, height: 0));
    }*/
  }

  onTapCurrentLocation() async {
    final geoLoc = ref.read(geoLocationRepositoryProvider);
    await geoLoc.getCurrentLocation().then((currentLocation) => _getHikes(
        GeoPoint(
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude,
            height: 0)));
  }

  _getHikes(GeoPoint origin) {
    final radius = ref.read(trackSearchFiltersServiceProvider).searchRadius;

    ref
        .read(searchTracksAroundLocationUsecaseProvider.notifier)
        .execute(origin, radius);
  }
}

useLocationSuggestionSearchController(WidgetRef ref) {
  final controller =
      useMemoized(() => LocationSuggestionSearchController(ref: ref), [ref]);

  return controller;
}
