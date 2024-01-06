import 'dart:async';

import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_tracks_by_content.g.dart';

@riverpod
class SearchTracksByContent extends _$SearchTracksByContent {
  @override
  FutureOr<void> build() {}

  Future<List<String>> execute(String text) async {
    final trackRepository = ref.read(trackRepositoryProvider);

    return trackRepository
        .searchTrackByContent(SearchByContentInput(content: text));
  }
}
