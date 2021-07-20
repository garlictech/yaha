import 'package:flutter/material.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';
import 'package:yaha/yaha-border-width.dart';
import 'package:yaha/yaha-box-sizes.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Explore',
                          style: TextStyle(
                              fontSize: YahaFontSizes.large,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor)),
                      Container(
                        padding: EdgeInsets.only(top: YahaSpaceSizes.large),
                        child: SizedBox(
                          width: 300.0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Search for hike',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: SizedBox(
                                  height: 40.0,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: YahaSpaceSizes.medium),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                YahaBorderRadius.small),
                                            borderSide: BorderSide(
                                                color: YahaColors.textColor,
                                                width: YahaBorderWidth.small)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                YahaBorderRadius.small),
                                            borderSide: BorderSide(
                                                color: YahaColors.secondary,
                                                width: YahaBorderWidth.small))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 270.0,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Search around location',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: YahaSpaceSizes.xSmall,
                                        bottom: YahaSpaceSizes.general),
                                    child: SizedBox(
                                      height: 40.0,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.small),
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.gps_not_fixed,
                                                color: YahaColors.textColor,
                                              ),
                                              onPressed: () {
                                                setState(() {});
                                              },
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: YahaSpaceSizes.medium),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        YahaBorderRadius.small),
                                                borderSide: BorderSide(
                                                    color: YahaColors.textColor,
                                                    width:
                                                        YahaBorderWidth.small)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        YahaBorderRadius.small),
                                                borderSide: BorderSide(
                                                    color: YahaColors.secondary,
                                                    width:
                                                        YahaBorderWidth.small))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.0, child: Icon(Icons.filter_list))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.large,
                            left: YahaSpaceSizes.large),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Recent searches',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        
                        child: SizedBox(
                          
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text(
                              'Explore',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
                          ),
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
