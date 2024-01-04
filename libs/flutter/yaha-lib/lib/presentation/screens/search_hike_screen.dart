import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers.dart';
import '../widgets/hikes/hikes.dart';
import '../widgets/map/map.dart';
import '../widgets/search/search.dart';
import '../widgets/shared/shared.dart';
import '../widgets/utils/utils.dart';

class SearchHikeScreenFieldViewModel {
  final bool mapShown;
  SearchHikeScreenFieldViewModel({this.mapShown = false});
}

class SearchHikeScreenFieldPresenter
    extends StateNotifier<SearchHikeScreenFieldViewModel> {
  final Ref ref;
  late final dynamic mapPresenter;

  SearchHikeScreenFieldPresenter({required this.ref})
      : super(SearchHikeScreenFieldViewModel());

  onMapToggle() {
    state = SearchHikeScreenFieldViewModel(mapShown: !state.mapShown);
  }
}

final presenterInstance = StateNotifierProvider<SearchHikeScreenFieldPresenter,
    SearchHikeScreenFieldViewModel>((ref) {
  return SearchHikeScreenFieldPresenter(ref: ref);
});

class SearchHikeScreen extends ConsumerStatefulWidget {
  const SearchHikeScreen({super.key});

  @override
  SearchHikeScreenState createState() => SearchHikeScreenState();
}

class SearchHikeScreenState extends ConsumerState<SearchHikeScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'by location'),
    Tab(text: 'by content'),
  ];

  late TabController _tabController;
  late final dynamic mapPresenter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(trackSearchControllerProvider);
    final model = ref.watch(presenterInstance);
    final presenter = ref.watch(presenterInstance.notifier);

    return Scaffold(
        appBar: AppBar(title: TabBar(controller: _tabController, tabs: myTabs)),
        body: SafeArea(
            child: Column(children: [
          Container(
              height: 80,
              padding: const EdgeInsets.only(
                left: YahaSpaceSizes.small,
                right: YahaSpaceSizes.small,
                top: YahaSpaceSizes.small,
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child:
                        TabBarView(controller: _tabController, children: const [
                  LocationSearchByGoogleField(),
                  Align(
                      alignment: Alignment.center,
                      child: HikeSearchByContentField())
                ])),
                IconButton(
                    onPressed: presenter.onMapToggle,
                    icon: Icon(model.mapShown ? Icons.list : Icons.map)),
                IconButton(
                    onPressed: () {
                      /* showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => const HikeFilters(),
                      );*/

                      showDialog(
                          context: context,
                          builder: (context) => const SuccessPopup(
                              title: "Future feature",
                              content:
                                  "You will be able to select hikes by duration, difficulty, etc. Stay tuned!",
                              buttonTitle: "Cool"));
                    },
                    icon: Image.asset(
                      'packages/flutter_yaha_lib/assets/images/filter-icon.png',
                      width: YahaIconSizes.small,
                    )),
              ])),
          Expanded(
              child: searchState.when(
                  error: errorWidget,
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (hits) => hits.tracks.isEmpty
                      ? const Center(child: Text("No hikes"))
                      : model.mapShown
                          ? const HikeSearchSesultsOnMap()
                          : ListView(
                              itemExtent: 230,
                              children: hits.tracks
                                  .map((hit) => Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 5, right: 5),
                                      child: HikeCard(
                                          hikeId: hit.id,
                                          distanceFromCurrentLocation: 2)))
                                  .toList()))),
        ])));
  }
}
