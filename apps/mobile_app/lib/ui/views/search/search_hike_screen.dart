import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../hikes/map/widgets/leaflet-map.dart';
import '/domain/domain.dart';
import '../hikes/hike/widgets/hike-card.dart';
import 'location_search_by_google.dart';

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
    final searchState = ref.watch(hikeSearchStateProvider);
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
                InkWell(
                    onTap: presenter.onMapToggle,
                    child: Icon(model.mapShown ? Icons.list : Icons.map))
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
/*Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  iconSize: YahaFontSizes.xxLarge,
                  icon: Image.asset(
                    'assets/images/filter-icon.png',
                    width: YahaIconSizes.medium,
                  ),
                  onPressed: () => showBarModalBottomSheet(
                    expand: false,
                    useRootNavigator: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          color: YahaColors.accentColor,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: YahaSpaceSizes.medium,
                                  right: YahaSpaceSizes.general,
                                ),
                                color: YahaColors.accentColor,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          primary:
                                              YahaColors.secondaryAccentColor,
                                        ),
                                        child: const Text("Reset"),
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Filters",
                                        style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Icon(
                                          Icons.close_outlined,
                                          color:
                                              YahaColors.secondaryAccentColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: YahaColors.background,
                                child: const HikeFilterPage(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),*/
