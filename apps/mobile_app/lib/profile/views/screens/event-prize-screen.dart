import 'package:flutter/material.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class EventPrizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Adventurers Paw',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.large),
                        child: Container(
                          width: YahaBoxSizes.widthSmall,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: YahaBorderWidth.medium,
                                color: YahaColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general)),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Image.asset('assets/images/adventurers-paw.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur a enim ut purus aliquet imperdiet sit amet a mauris. Ut nisl nisi, imperdiet vel volutpat non, pharetra eget mi. Aliquam erat volutpat. Mauris scelerisque sapien eu diam faucibus facilisis. Nunc luctus at odio a luctus. Nullam scelerisque, ligula sollicitudin vulputate maximus, urna purus facilisis ante, ac interdum dolor enim in ipsum. Nunc et tortor lectus. Sed lacinia purus eu ex porta, sit amet dapibus libero sollicitudin. Maecenas et est vel ex convallis laoreet ut et metus. Integer elementum fermentum lorem aliquet condimentum. Quisque viverra efficitur.',
                          style: TextStyle(fontSize: YahaFontSizes.small),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
