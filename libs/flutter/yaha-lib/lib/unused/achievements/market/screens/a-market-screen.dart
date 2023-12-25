import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/achievements/market/widgets/time-capsule-box-widget-found.dart';
import 'package:flutter_yaha_lib/ui/views/achievements/market/widgets/time-capsule-box-widget-not-found.dart';
import 'package:flutter_yaha_lib/ui/views/achievements/market/widgets/time-capsule-box-widget-own.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class AMarketScreen extends StatelessWidget {
  const AMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marketplace',
          style: TextStyle(
              color: YahaColors.textColor,
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general, bottom: 6.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Popular TimeCapsules',
                            style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 6.0, bottom: 10.0, left: 6.0),
                                child: TimeCapsuleBoxWidgetOwn(
                                    size: MediaQuery.of(context).size.width *
                                        0.55),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 6.0, bottom: 10.0, left: 16.0),
                                child: TimeCapsuleBoxWidgetFound(
                                    size: MediaQuery.of(context).size.width *
                                        0.55),
                              ),
                            ],
                          ),
                        ),
                        const ShowMoreButton(nextScreen: AMarketScreen()),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              bottom: YahaSpaceSizes.medium),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Newly Minted',
                            style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: YahaSpaceSizes.medium,
                            children: [
                              TimeCapsuleBoxWidgetOwn(
                                size: MediaQuery.of(context).size.width * 0.43,
                              ),
                              TimeCapsuleBoxWidgetNotFound(
                                size: MediaQuery.of(context).size.width * 0.43,
                              ),
                              TimeCapsuleBoxWidgetFound(
                                size: MediaQuery.of(context).size.width * 0.43,
                              ),
                              TimeCapsuleBoxWidgetFound(
                                size: MediaQuery.of(context).size.width * 0.43,
                              ),
                            ],
                          ),
                        ),
                        const ShowMoreButton(nextScreen: AMarketScreen()),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
