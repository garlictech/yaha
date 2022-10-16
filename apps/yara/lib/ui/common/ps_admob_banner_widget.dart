
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttermultirestaurant/constant/ps_constants.dart';
import 'package:fluttermultirestaurant/utils/utils.dart';
import 'package:fluttermultirestaurant/viewobject/common/ps_value_holder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class PsAdMobBannerWidget extends StatefulWidget {
  const PsAdMobBannerWidget({
    this.admobSize});
    
  final AdSize? admobSize;

  @override
  _PsAdMobBannerWidgetState createState() => _PsAdMobBannerWidgetState();
}

class _PsAdMobBannerWidgetState extends State<PsAdMobBannerWidget> {
  bool showAds = false;
  bool isConnectedToInternet = false;
  bool isShouldLoadAdMobBanner = true;
  int currentRetry = 0;
  int retryLimit = 1;

  StreamSubscription<dynamic>? _subscription;
  BannerAd? _bannerAd;
  double height = 0;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: Utils.getBannerAdUnitId(),
      request: const AdRequest(),
      size: widget.admobSize!,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            if (widget.admobSize != null) {
              if (widget.admobSize == AdSize.banner) {
                height = 80;
              } else {
                height = 250;
              }
            }
          });
          print('loaded');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) {
          print('$BannerAd onAdOpened.');
        },
        onAdClosed: (Ad ad) {
          print('$BannerAd onAdClosed.');
        },
      ),
    );
    _bannerAd?.load();
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void checkConnection() {
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
      if (isConnectedToInternet && showAds) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final PsValueHolder psValueHolder = Provider.of<PsValueHolder>(context);

    if (psValueHolder.isShowAdmob != null &&
        psValueHolder.isShowAdmob == PsConst.ONE) {
        showAds = true;
    } else {
        showAds = false;
    }
    if (!isConnectedToInternet && showAds) {
      print('loading ads....');
      checkConnection();
    }
    return Container(
      alignment: Alignment.center,
      child: showAds ? AdWidget(ad: _bannerAd!) : Container(),
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
    );
  }
}

