import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/config/ps_colors.dart';
import 'package:yara/constant/ps_constants.dart';
import 'package:yara/constant/ps_dimens.dart';
import 'package:yara/ui/common/ps_admob_banner_widget.dart';
import 'package:yara/ui/common/ps_back_button_with_circle_bg_widget.dart';
import 'package:yara/ui/common/ps_ui_widget.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/blog.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class BlogView extends StatefulWidget {
  const BlogView({Key? key, required this.blog, required this.heroTagImage})
      : super(key: key);

  final Blog blog;
  final String heroTagImage;

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  bool isReadyToShowAppBarIcons = false;

  @override
  Widget build(BuildContext context) {
    if (!isReadyToShowAppBarIcons) {
      Timer(const Duration(milliseconds: 800), () {
        setState(() {
          isReadyToShowAppBarIcons = true;
        });
      });
    }

    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Utils.getBrightnessForAppBar(context)),
          expandedHeight: PsDimens.space300,
          floating: true,
          pinned: true,
          snap: false,
          elevation: 0,
          leading: PsBackButtonWithCircleBgWidget(
              isReadyToShow: isReadyToShowAppBarIcons),
          backgroundColor: PsColors.mainColor,
          flexibleSpace: FlexibleSpaceBar(
            background: PsNetworkImage(
              photoKey: widget.heroTagImage,
              height: PsDimens.space300,
              width: double.infinity,
              defaultPhoto: widget.blog.defaultPhoto!,
              boxfit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: TextWidget(
            blog: widget.blog,
          ),
        )
      ],
    ));
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final Blog blog;

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool isConnectedToInternet = false;
  bool isSuccessfullyLoaded = true;
  bool isShowAdmob = true;

  void checkConnection() {
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
      if (isConnectedToInternet && isShowAdmob) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final PsValueHolder valueHolder = 
        Provider.of<PsValueHolder>(context);

    if (valueHolder.isShowAdmob != null &&
        valueHolder.isShowAdmob == PsConst.ONE) {
        isShowAdmob = true;
    } else {
        isShowAdmob = false;
    }
    if (!isConnectedToInternet && isShowAdmob) {
      print('loading ads....');
      checkConnection();
    }
    return Container(
      color: PsColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(PsDimens.space16),
            child: Text(
              widget.blog.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: PsDimens.space16,
                right: PsDimens.space16,
                bottom: PsDimens.space16),
            child: Text(
              widget.blog.description!,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
            ),
          ),
          const PsAdMobBannerWidget(admobSize: AdSize.banner),
        ],
      ),
    );
  }
}
