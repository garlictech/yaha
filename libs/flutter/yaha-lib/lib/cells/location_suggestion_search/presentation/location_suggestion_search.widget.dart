import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/presentation/widgets/shared/shared.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'location_suggestion_search.controller.dart';

class LocationSuggestionSearchField extends HookConsumerWidget {
  const LocationSuggestionSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final controller = useLocationSuggestionSearchController(ref);

    TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.public),
        labelText: 'Enter location',
        border: OutlineInputBorder(),
      ),
    );
    /* Expanded(
          child: TypeAheadField(
        debounceDuration: const Duration(seconds: 1),
        suggestionsCallback: (pattern) async {
          return await controller.getSuggestions(pattern);
        },
        itemBuilder: (context, hit) {
          return ListTile(
            title: Text((hit as PlacesSearchResult).name),
          );
        },
        onSelected: (suggestion) {
          controller.suggestionSelected(suggestion as PlacesSearchResult);
        },
      )),
      InkWell(
          onTap: controller.onTapCurrentLocation,
          child: const Padding(
              padding: EdgeInsets.only(left: YahaSpaceSizes.small),
              child: Icon(Icons.gps_not_fixed))),
    ]);*/
  }
}
