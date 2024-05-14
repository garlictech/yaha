import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_yaha_lib/cells/location_suggestion_search/location_suggestion_search.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/controllers.dart';
import '../widgets/map/map.dart';
import '../widgets/search/search.dart';
import '../widgets/shared/shared.dart';
import '../widgets/utils/utils.dart';

class SearchHikeScreen extends HookConsumerWidget {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'by location'),
    Tab(text: 'by content'),
  ];

  const SearchHikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(trackSearchControllerProvider);
    final mapShown = useState(false);
    final tabController = useTabController(initialLength: myTabs.length);

    onMapToggle() => mapShown.value = !mapShown.value;

    return Scaffold(
        appBar: AppBar(title: TabBar(controller: tabController, tabs: myTabs)),
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
                        TabBarView(controller: tabController, children: const [
                  LocationSuggestionSearchField(),
                  Align(
                      alignment: Alignment.center,
                      child: HikeSearchByContentField())
                ])),
                IconButton(
                    onPressed: onMapToggle,
                    icon: Icon(mapShown.value ? Icons.list : Icons.map)),
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
                      : mapShown.value
                          ? const HikeSearchResultsOnMap()
                          : HikeSearchResultList(tracks: hits.tracks))),
        ])));
  }
}
