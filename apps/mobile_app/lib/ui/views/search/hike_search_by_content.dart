import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/domain.dart';

import '../shared/widgets/yaha-text-input.dart';
import '/domain/domain.dart' as domain;

class HikeSearchByContentFieldViewModel {
  final List<String> hits;

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
    final hikeRepo = read(hikeRepositoryProvider);

    _subscription = subject
        .debounceTime(const Duration(seconds: 1))
        .where((text) => text.length > 2)
        .switchMap((String text) {
          return Stream.fromFuture(hikeRepo.searchHikeByContent(text));
        })
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

final presenterInstance = StateNotifierProvider.autoDispose<
        HikeSearchByContentFieldPresenter, HikeSearchByContentFieldViewModel>(
    (ref) => HikeSearchByContentFieldPresenter(read: ref.read));

class HikeSearchByContentField extends ConsumerWidget {
  const HikeSearchByContentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(presenterInstance);
    final presenter = ref.watch(presenterInstance.notifier);

    return Row(children: [
      YahaTextField(title: "Search for hike", controller: presenter.controller),
      ...model.hits
          .map((hit) => InkWell(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(hit)),
              onTap: () {
                debugPrint('$hit TAPPED');
              }))
          .toList(),
    ]);
  }
}
