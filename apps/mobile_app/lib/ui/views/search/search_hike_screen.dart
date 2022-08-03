import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../hikes/hike/widgets/hike-card.dart';
import 'location_search_by_google.dart';

import '../shared/shared.dart';
import 'hike_search_by_content.dart';

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
    final searchByContentPresenter =
        ref.watch(searchByContentPresenterInstance);

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
              child: TabBarView(controller: _tabController, children: const [
                LocationSearchByGoogleField(),
                HikeSearchByContentField()
              ])),
          Expanded(
              //padding: const EdgeInsets.all(20),
              child: ListView(
                  itemExtent: 230,
                  children: searchByContentPresenter.hits
                      .map((hit) => Container(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 5, right: 5),
                          child: HikeCard(
                              hike: hit, distanceFromCurrentLocation: 2)))
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
