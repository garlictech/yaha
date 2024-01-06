import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_search_controller.g.dart';

@riverpod
class TrackSearchController extends _$TrackSearchController {
  @override
  FutureOr<TrackSearchResults> build() {
    return TrackSearchResults(tracks: []);
  }

  Future<void> searchTracksAroundCurrentLocation() async {
    final usecase =
        ref.read(searchTracksAroundCurrentLocationUseCaseProvider.notifier);

    state = const AsyncLoading();

    final tracks = await usecase.execute();

    final resultsProcessor =
        ref.read(createTracksFromSearchResultsUsecaseProvider.notifier);

    state = await resultsProcessor.execute(tracks);
  }
}
