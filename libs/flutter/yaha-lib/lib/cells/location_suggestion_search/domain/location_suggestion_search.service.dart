import 'location_suggestion.dart';

abstract class LocationSuggestionSearch {
  Future<List<LocationSuggestion>> search(String query);
}
