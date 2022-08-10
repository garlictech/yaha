import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../hikes/hike/screens/hike-filter-screen.dart';
import '../hikes/map/widgets/leaflet-map.dart';
import '/domain/domain.dart' as domain;
import '../hikes/hike/widgets/hike-card.dart';
import 'location_search_by_google.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../shared/shared.dart';
import 'hike_search_by_content.dart';

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
  const SearchHikeScreen({Key? key}) : super(key: key);

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
    final searchState = ref.watch(domain.hikeSearchStateProvider);
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
              child: Row(children: [
                Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: const [
                      LocationSearchByGoogleField(),
                      HikeSearchByContentField()
                    ])),
                IconButton(
                    onPressed: presenter.onMapToggle,
                    icon: Icon(model.mapShown ? Icons.list : Icons.map)),
                IconButton(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => const HikeFilters(),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/filter-icon.png',
                      width: YahaIconSizes.small,
                    )),
              ])),
          Expanded(
              //padding: const EdgeInsets.all(20),
              child: searchState.searching
                  ? const Center(child: CircularProgressIndicator())
                  : searchState.noHits
                      ? const Center(child: Text("No hikes"))
                      : model.mapShown
                          ? LeafletMap(hikes: searchState.hits)
                          : ListView(
                              itemExtent: 230,
                              children: searchState.hits
                                  .map((hit) => Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 5, right: 5),
                                      child: HikeCard(
                                          hike: hit,
                                          distanceFromCurrentLocation: 2)))
                                  .toList())),
        ])));
  }
}
