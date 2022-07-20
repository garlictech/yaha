import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../shared/shared.dart';
import '../../../shared/widgets/location_search_by_google.dart';
import 'hike-filter-screen.dart';
import 'search-results-screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general,
              right: YahaSpaceSizes.general,
              top: YahaSpaceSizes.small,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: YahaFontSizes.medium,
                            fontWeight: FontWeight.w600,
                            color: YahaColors.textColor),
                      ),
                    ),
                    Align(
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
                                              child: const Text("Reset"),
                                              style: TextButton.styleFrom(
                                                primary: YahaColors
                                                    .secondaryAccentColor,
                                              ),
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
                                                color: YahaColors
                                                    .secondaryAccentColor,
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
                    ),
                  ],
                ),
                Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.only(
                        bottom: YahaSpaceSizes.general,
                        top: YahaSpaceSizes.general),
                    child: const YahaTextField(title: "Search for hike")),
                Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: const LocationSearchByGoogleField()),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.search,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchResultsScreen()));
                          },
                          label: const Text('Explore',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
