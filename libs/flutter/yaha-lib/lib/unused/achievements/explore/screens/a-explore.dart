import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class AExploreScreen extends StatelessWidget {
  const AExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600,
              color: YahaColors.textColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
            child: IconButton(
              iconSize: YahaFontSizes.xxLarge,
              icon: Image.asset(
                'packages/flutter_yaha_lib/assets/images/filter-icon.png',
                width: YahaIconSizes.medium,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general,
              right: YahaSpaceSizes.general,
              top: YahaSpaceSizes.general),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints:
                    const BoxConstraints(maxWidth: YahaBoxSizes.maxWidth400),
                padding: const EdgeInsets.only(bottom: YahaSpaceSizes.large),
                child: const YahaTextField(title: "Search for TimeCapsules"),
              ),
              const Text(
                'Recent searches',
                style: TextStyle(
                    color: YahaColors.textColor,
                    fontSize: YahaFontSizes.medium,
                    fontWeight: FontWeight.w600),
              ),
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
                        onPressed: () {},
                        label: const Text('Search',
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
    );
  }
}
