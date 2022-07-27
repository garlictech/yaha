import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/domain.dart';

import '/domain/domain.dart' as domain;
import 'yaha-text-input.dart';

const kGoogleApiKey = "AIzaSyDZjCPlj3vAGrVYfimxRlcKk72F1aoAPxo";
final places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class LocationSearchByGoogleFieldViewModel {
  final List<PlacesSearchResult> hits;

  LocationSearchByGoogleFieldViewModel({required this.hits});
}

class LocationSearchByGoogleFieldPresenter
    extends StateNotifier<LocationSearchByGoogleFieldViewModel> {
  final controller = TextEditingController();
  late final StreamSubscription _subscription;
  final Reader read;

  LocationSearchByGoogleFieldPresenter({required this.read})
      : super(LocationSearchByGoogleFieldViewModel(hits: [])) {
    final subject = PublishSubject<String>();
    _subscription = subject
        .debounceTime(const Duration(seconds: 1))
        .where((text) => text.length > 2)
        .switchMap((String text) {
          return Stream.fromFuture(places.searchByText(text));
        })
        .map((res) => res.results.toList())
        .doOnData(
            (hits) => state = LocationSearchByGoogleFieldViewModel(hits: hits))
        .listen(null);

    controller.addListener(() {
      subject.add(controller.text);
    });
  }

  onTapHit(Geometry geometry) {
    state = LocationSearchByGoogleFieldViewModel(hits: []);
    read(domain.hikeSearchStateProvider.notifier).updateOrigin(domain.Location(
        lat: geometry.location.lat, lon: geometry.location.lng));
    debugPrint(geometry.location.lat.toString());
  }

  onTapCurrentLocation() {
    debugPrint("****");
    final geoLoc = read(geoLocationRepositoryProvider);

    geoLoc.getCurrentLocation().then((currentLocation) =>
        read(domain.hikeSearchStateProvider.notifier).updateOrigin(
            domain.Location(
                lat: currentLocation.latitude,
                lon: currentLocation.longitude)));
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

final presenterInstance = StateNotifierProvider.autoDispose<
        LocationSearchByGoogleFieldPresenter,
        LocationSearchByGoogleFieldViewModel>(
    (ref) => LocationSearchByGoogleFieldPresenter(read: ref.read));

class LocationSearchByGoogleField extends ConsumerWidget {
  const LocationSearchByGoogleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(presenterInstance);
    final presenter = ref.watch(presenterInstance.notifier);
    final searchState = ref.watch(hikeSearchStateProvider);

    return Row(
        children: [const Icon(Icons.gps_not_fixed), const Text("atyal;a")]);
    /*...model.hits
          .map((hit) => InkWell(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(hit.name)),
              onTap: () {
                if (hit.geometry != null) {
                  presenter.onTapHit(hit.geometry!);
                }
              }))
          .toList(),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
          child: Text(
              'Origin lon: ${searchState.origin.lon}, lat: ${searchState.origin.lat}')),
    ]);*/
  }
}
