import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';

class AExploreScreen extends StatelessWidget {
  const AExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () {}),
                  ),
                ],
              ),
              Container(
                constraints:
                    const BoxConstraints(maxWidth: YahaBoxSizes.maxWidth400),
                padding: const EdgeInsets.only(
                    bottom: YahaSpaceSizes.large, top: YahaSpaceSizes.large),
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
