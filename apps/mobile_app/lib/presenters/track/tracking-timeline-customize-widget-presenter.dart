import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/viewmodels/track/tracking-timeline-customize-widget-viewmodel.dart';

class TrackingTimelineCustomizeWidgetPresenter
    extends StateNotifier<TrackingTimelineCustomizeWidgetViewModel> {
  final ProviderReference ref;

  TrackingTimelineCustomizeWidgetPresenter({required this.ref})
      : super(TrackingTimelineCustomizeWidgetViewModel());

  togglePoiSwitch() => state =
      new TrackingTimelineCustomizeWidgetViewModel(showPois: !state.showPois);

  toggleNaturalPhenomenonsSwitch() =>
      state = new TrackingTimelineCustomizeWidgetViewModel(
          showNaturalPhenomenons: !state.showNaturalPhenomenons);

  toggleTimeCapsulesSwitch() =>
      state = new TrackingTimelineCustomizeWidgetViewModel(
          showTimeCapsules: !state.showTimeCapsules);

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}

final trackingTimelineCustomizeWidgetMVPProvider = StateNotifierProvider<
    TrackingTimelineCustomizeWidgetPresenter,
    TrackingTimelineCustomizeWidgetViewModel>((ref) {
  return TrackingTimelineCustomizeWidgetPresenter(ref: ref);
});
