import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/track/tracking-timeline-customize-widget-viewmodel.dart';

class TrackingTimelineCustomizeWidgetPresenter
    extends StateNotifier<TrackingTimelineCustomizeWidgetViewModel> {
  final Ref ref;

  TrackingTimelineCustomizeWidgetPresenter({required this.ref})
      : super(TrackingTimelineCustomizeWidgetViewModel());

  togglePoiSwitch() => state =
      TrackingTimelineCustomizeWidgetViewModel(showPois: !state.showPois);

  toggleNaturalPhenomenonsSwitch() =>
      state = TrackingTimelineCustomizeWidgetViewModel(
          showNaturalPhenomenons: !state.showNaturalPhenomenons);

  toggleTimeCapsulesSwitch() =>
      state = TrackingTimelineCustomizeWidgetViewModel(
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
