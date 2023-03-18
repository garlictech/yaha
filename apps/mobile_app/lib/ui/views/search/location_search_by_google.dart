import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:yaha/app/providers.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../shared/shared.dart';
import '/domain/domain.dart' as domain;

const kGoogleApiKey = "AIzaSyDZjCPlj3vAGrVYfimxRlcKk72F1aoAPxo";
final places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class LocationSearchByGoogleFieldViewModel {
  final List<PlacesSearchResult> hits;
  LocationSearchByGoogleFieldViewModel({required this.hits});
}

class LocationSearchByGoogleFieldPresenter
    extends StateNotifier<LocationSearchByGoogleFieldViewModel> {
  final Ref ref;

  LocationSearchByGoogleFieldPresenter({required this.ref})
      : super(LocationSearchByGoogleFieldViewModel(hits: []));

  getSuggestions(String pattern) {
    return places.searchByText(pattern).then((response) => response.results);
  }

  suggestionSelected(PlacesSearchResult result) async {
    final location = result.geometry?.location;

    if (location != null) {
      await _getHikes(domain.Point(
          latitude: location.lat, longitude: location.lng, height: 0));
    }
  }

  onTapCurrentLocation() async {
    final geoLoc = ref.read(geoLocationRepositoryProvider);
    await geoLoc.getCurrentLocation().then((currentLocation) => _getHikes(
        domain.Point(
            latitude: currentLocation.latitude,
            longitude: currentLocation.longitude,
            height: 0)));
  }

  _getHikes(domain.Point origin) {
    ref
        .read(domain.hikeSearchStateProvider.notifier)
        .searchAroundLocation(origin);
  }
}

final presenterInstance = StateNotifierProvider.autoDispose<
        LocationSearchByGoogleFieldPresenter,
        LocationSearchByGoogleFieldViewModel>(
    (ref) => LocationSearchByGoogleFieldPresenter(ref: ref));

class LocationSearchByGoogleField extends ConsumerWidget {
  const LocationSearchByGoogleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(presenterInstance.notifier);

    return Row(children: [
      InkWell(
          onTap: presenter.onTapCurrentLocation,
          child: const Icon(Icons.gps_not_fixed)),
      Expanded(
          child: TypeAheadField(
        textFieldConfiguration: const TextFieldConfiguration(
            autocorrect: false,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: YahaColors.textColor,
                fontSize: YahaFontSizes.small),
            cursorColor: YahaColors.primary,
            decoration: InputDecoration(
                focusColor: YahaColors.military,
                labelText: "Search hike",
                labelStyle: TextStyle(color: YahaColors.primary),
                contentPadding: EdgeInsets.only(
                    left: YahaSpaceSizes.medium, bottom: YahaSpaceSizes.small),
                errorStyle: TextStyle(
                    fontSize: YahaFontSizes.xSmall,
                    fontWeight: FontWeight.w500))),
        suggestionsCallback: (pattern) async {
          return await presenter.getSuggestions(pattern);
        },
        itemBuilder: (context, hit) {
          return ListTile(
            title: Text((hit as PlacesSearchResult).name),
          );
        },
        onSuggestionSelected: (suggestion) {
          presenter.suggestionSelected(suggestion as PlacesSearchResult);
        },
      ))
    ]);
  }
}
