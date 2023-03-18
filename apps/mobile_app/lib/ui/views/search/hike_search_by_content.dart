import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../shared/widgets/yaha-text-input.dart';
import '/domain/domain.dart' as domain;

class HikeSearchByContentFieldViewModel {
  HikeSearchByContentFieldViewModel();
}

class HikeSearchByContentFieldPresenter
    extends StateNotifier<HikeSearchByContentFieldViewModel> {
  final controller = TextEditingController();
  late final StreamSubscription _subscription;
  final Ref ref;

  HikeSearchByContentFieldPresenter({required this.ref})
      : super(HikeSearchByContentFieldViewModel()) {
    final subject = PublishSubject<String>();

    _subscription = subject
        .debounceTime(const Duration(seconds: 1))
        .where((text) => text.length > 2)
        .doOnData((String text) => ref
            .read(domain.hikeSearchStateProvider.notifier)
            .searchInContent(text))
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
    (ref) => HikeSearchByContentFieldPresenter(ref: ref));

class HikeSearchByContentField extends ConsumerWidget {
  const HikeSearchByContentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(searchByContentPresenterInstance.notifier);

    return YahaTextField(
        title: "Search hike", controller: presenter.controller);
  }
}
