import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:rxdart/rxdart.dart';

import 'yaha-text-input.dart';

const kGoogleApiKey = "AIzaSyDZjCPlj3vAGrVYfimxRlcKk72F1aoAPxo";
final places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class LocationSearchByGoogleFieldViewModel {
  final List<PlacesSearchResult> hits;
  final bool working;

  LocationSearchByGoogleFieldViewModel(
      {required this.hits, this.working = false});
}

class LocationSearchByGoogleFieldPresenter
    extends StateNotifier<LocationSearchByGoogleFieldViewModel> {
  final controller = TextEditingController();
  late final StreamSubscription _subscription;

  LocationSearchByGoogleFieldPresenter()
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
    state = LocationSearchByGoogleFieldViewModel(hits: [], working: true);
    debugPrint(geometry.location.lat.toString());
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
    (ref) => LocationSearchByGoogleFieldPresenter());

class LocationSearchByGoogleField extends ConsumerWidget {
  const LocationSearchByGoogleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(presenterInstance);
    final presenter = ref.watch(presenterInstance.notifier);

    return Column(children: [
      YahaTextField(
        title: 'Search around location',
        icon: Icons.gps_not_fixed,
        controller: presenter.controller,
      ),
      ...model.hits
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
      ...(model.working
          ? [
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
                  child: Text("Let's see...")),
              const CircularProgressIndicator()
            ]
          : [])
    ]);
  }
}
