import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/app/providers.dart';

import '../shared/widgets/yaha-text-input.dart';
import '/domain/domain.dart' as domain;

class HikeSearchByContentFieldViewModel {
  final List<domain.Hike> hits;

  HikeSearchByContentFieldViewModel({required this.hits});
}

class HikeSearchByContentFieldPresenter
    extends StateNotifier<HikeSearchByContentFieldViewModel> {
  final controller = TextEditingController();
  late final StreamSubscription _subscription;
  final Reader read;

  HikeSearchByContentFieldPresenter({required this.read})
      : super(HikeSearchByContentFieldViewModel(hits: [])) {
    final subject = PublishSubject<String>();
    final hikeSearchUseCases = read(hikeSearchUsecasesProvider);

    _subscription = subject
        .debounceTime(const Duration(seconds: 1))
        .where((text) => text.length > 2)
        .switchMap((String text) => Stream.fromFuture(
            hikeSearchUseCases.searchHikesByContent(text, 10)))
        .doOnData(
            (hits) => state = HikeSearchByContentFieldViewModel(hits: hits))
        .listen(null);

    controller.addListener(() {
      subject.add(controller.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

final searchByContentPresenterInstance = StateNotifierProvider.autoDispose<
        HikeSearchByContentFieldPresenter, HikeSearchByContentFieldViewModel>(
    (ref) => HikeSearchByContentFieldPresenter(read: ref.read));

class HikeSearchByContentField extends ConsumerWidget {
  const HikeSearchByContentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(searchByContentPresenterInstance.notifier);

    return YahaTextField(
        title: "Search for hike", controller: presenter.controller);
  }
}
