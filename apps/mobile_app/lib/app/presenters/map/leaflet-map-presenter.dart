import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/viewmodels/map/leaflet-map-viewmodel.dart';
import 'package:yaha/domain/domain.dart';

class LeafletMapPresenter extends StateNotifier<LeafletMapViewmodel> {
  LeafletMapPresenter() : super(LeafletMapViewmodel());

  addHike(Hike hike) {
    state = state.copyWith(hikes: state.hikes + [hike]);
  }

  addPoi(Poi poi) {
    state = state.copyWith(pois: state.pois + [poi]);
  }

  addHikes(List<Hike> hikes) {
    state = state.copyWith(hikes: state.hikes + hikes);
  }

  addPois(List<Poi> pois) {
    state = state.copyWith(pois: state.pois + pois);
  }

  set mapCenter(Location newCenter) {
    state = state.copyWith(mapCenter: newCenter);
  }
}

final leafletMapMVPProvider = StateNotifierProvider.autoDispose
    .family<LeafletMapPresenter, LeafletMapViewmodel, Key?>(
        (ref, key) => LeafletMapPresenter());
