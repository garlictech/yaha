import 'package:flutter/material.dart';
import 'package:yara/constant/route_paths.dart';
import 'package:yara/ui/app_info/app_info_view.dart';
import 'package:yara/ui/app_loading/app_loading-view.dart';
import 'package:yara/ui/basket/list/basket_list_container.dart';
import 'package:yara/ui/best_choice/best_choice_list_by_collection_id_view.dart';
import 'package:yara/ui/blog/detail/blog_view.dart';
import 'package:yara/ui/blog/list/blog_list_container.dart';
import 'package:yara/ui/category/filter_list/category_filter_list_view.dart';
import 'package:yara/ui/category/list/category_list_view_container.dart';
import 'package:yara/ui/checkout/checkout_container_view.dart';
import 'package:yara/ui/checkout/checkout_status_view.dart';
import 'package:yara/ui/checkout/credit_card_view.dart';
import 'package:yara/ui/checkout/one_page_checkout/billing_to_view.dart';
import 'package:yara/ui/checkout/one_page_checkout/delivery_location_view.dart';
import 'package:yara/ui/checkout/one_page_checkout/one_one_checkout_container_view.dart';
import 'package:yara/ui/checkout/one_page_checkout/order_time_view.dart';
import 'package:yara/ui/checkout/one_page_checkout/payment_method.dart';
// import 'package:yara/ui/checkout/pay_stack_view.dart';
import 'package:yara/ui/checkout/schedule_checkout_status_view.dart';
import 'package:yara/ui/checkout/whatsapp_checkout/whatsapp_checkout_container_view.dart';
import 'package:yara/ui/collection/header_list/collection_header_list_container.dart';
import 'package:yara/ui/comment/detail/comment_detail_list_view.dart';
import 'package:yara/ui/comment/list/comment_list_view.dart';
import 'package:yara/ui/contact/contact_us_container_view.dart';
import 'package:yara/ui/dashboard/core/dashboard_view.dart';
import 'package:yara/ui/dashboard/home/shop_dashboard_container_view.dart';
import 'package:yara/ui/force_update/force_update_view.dart';
import 'package:yara/ui/gallery/detail/gallery_view.dart';
import 'package:yara/ui/gallery/grid/gallery_grid_view.dart';
import 'package:yara/ui/gallery/grid/shop_gallery_grid_view.dart';
import 'package:yara/ui/history/list/history_list_container.dart';
import 'package:yara/ui/introslider/intro_slider_view.dart';
import 'package:yara/ui/language/list/language_list_view.dart';
import 'package:yara/ui/map/map_pin_view.dart';
import 'package:yara/ui/map/nearest_shop_google_map_view.dart';
import 'package:yara/ui/map/nearest_shop_map_view.dart';
import 'package:yara/ui/noti/detail/noti_view.dart';
import 'package:yara/ui/noti/list/noti_list_view.dart';
import 'package:yara/ui/noti/notification_setting/notification_setting_view.dart';
import 'package:yara/ui/product/attribute_detail/attribute_detail_list_view.dart';
import 'package:yara/ui/product/collection_product/product_list_by_collection_id_view.dart';
import 'package:yara/ui/product/detail/product_detail_view.dart';
import 'package:yara/ui/product/favourite/favourite_product_list_container.dart';
import 'package:yara/ui/product/list_with_filter/filter/category/filter_list_view.dart';
import 'package:yara/ui/product/list_with_filter/filter/filter/item_search_view.dart';
import 'package:yara/ui/product/list_with_filter/filter/sort/item_sorting_view.dart';
import 'package:yara/ui/product/list_with_filter/product_list_with_filter_container.dart';
//import 'package:yara/ui/qr_code_scanner/qr_code_scanner.dart';
import 'package:yara/ui/rating/list/rating_list_view.dart';
import 'package:yara/ui/rating/list/shop_rating_list_view.dart';
import 'package:yara/ui/reservation/entry/create_reservation_container_view.dart';
import 'package:yara/ui/reservation/list/reservation_list_container.dart';
import 'package:yara/ui/reservation/list/reservation_shop_list_view.dart';
import 'package:yara/ui/schedule_order/list/schedule_order_list_view.dart';
import 'package:yara/ui/schedule_transaction/detail/schedule_transaction_item_list_view.dart';
import 'package:yara/ui/search/home_item_search_container_view.dart';
import 'package:yara/ui/search/search_category_view_all/search_category_view_all_container.dart';
import 'package:yara/ui/search/search_item_view_all/search_item_view_all_container.dart';
import 'package:yara/ui/search/search_shop_view_all/search_shop_view_all_container.dart';
import 'package:yara/ui/search/search_sub_category_view_all/search_sub_category_view_all_container.dart';
import 'package:yara/ui/search_history/search_history_list_view.dart';
import 'package:yara/ui/search_item/search_item_list_view.dart';
import 'package:yara/ui/setting/setting_container_view.dart';
import 'package:yara/ui/setting/setting_privacy_policy_view.dart';
import 'package:yara/ui/shop/branch/shop_branch_container.dart';
import 'package:yara/ui/shop/shop_info_container_view.dart';
import 'package:yara/ui/shop_list/shop_list_view.dart';
import 'package:yara/ui/subcategory/filter/sub_category_search_list_view.dart';
import 'package:yara/ui/subcategory/list/sub_category_grid_view.dart';
import 'package:yara/ui/transaction/detail/transaction_item_list_view.dart';
import 'package:yara/ui/transaction/list/transaction_list_container.dart';
import 'package:yara/ui/user/edit_profile/area_list_view.dart';
import 'package:yara/ui/user/edit_profile/edit_profile_view.dart';
import 'package:yara/ui/user/forgot_password/forgot_password_container_view.dart';
import 'package:yara/ui/user/login/login_container_view.dart';
import 'package:yara/ui/user/more/more_container_view.dart';
import 'package:yara/ui/user/password_update/change_password_view.dart';
import 'package:yara/ui/user/phone/sign_in/phone_sign_in_container_view.dart';
import 'package:yara/ui/user/phone/verify_phone/verify_phone_container_view.dart';
import 'package:yara/ui/user/register/register_container_view.dart';
import 'package:yara/ui/user/verify/verify_email_container_view.dart';
import 'package:yara/viewobject/blog.dart';
import 'package:yara/viewobject/category.dart';
import 'package:yara/viewobject/comment_header.dart';
import 'package:yara/viewobject/default_photo.dart';
import 'package:yara/viewobject/holder/intent_holder/attribute_detail_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/billing_to_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/blog_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/checkout_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/checkout_status_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/checkout_status_schedule_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/credit_card_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/delivery_location_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/order_time_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/payment_intent_holder.dart';
// import 'package:yara/viewobject/holder/intent_holder/paystack_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/privacy_policy_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/product_detail_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/product_list_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/shop_data_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/shop_info_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/shop_list_intent_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/verify_phone_internt_holder.dart';
import 'package:yara/viewobject/holder/intent_holder/whatsApp_checkout_intent_holder.dart';
import 'package:yara/viewobject/holder/map_pin_intent_holder.dart';
import 'package:yara/viewobject/holder/product_parameter_holder.dart';
import 'package:yara/viewobject/noti.dart';
import 'package:yara/viewobject/product.dart';
import 'package:yara/viewobject/ps_app_version.dart';
import 'package:yara/viewobject/schedule_header.dart';
import 'package:yara/viewobject/shop_info.dart';
import 'package:yara/viewobject/transaction_header.dart';
import 'package:yara/viewobject/user.dart';
// ignore: library_prefixes
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMap;
import 'package:latlong2/latlong.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              AppLoadingView());

    case '${RoutePaths.home}':
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.home),
          builder: (BuildContext context) {
            return DashboardView();
          });

    case '${RoutePaths.shop_dashboard}':
      final Object? args = settings.arguments;
      final ShopDataIntentHolder shopDataIntentHolder =
          args as ShopDataIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopDashboardContainerView(
                  shopId: shopDataIntentHolder.shopId,
                  shopName: shopDataIntentHolder.shopName));

    case '${RoutePaths.force_update}':
      final Object? args = settings.arguments;
      final PSAppVersion psAppVersion = args as PSAppVersion;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ForceUpdateView(psAppVersion: psAppVersion));

    case '${RoutePaths.introSlider}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final int settingSlider = args as int;
        return IntroSliderView(settingSlider: settingSlider);
      });
    case '${RoutePaths.user_register_container}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              RegisterContainerView());
    case '${RoutePaths.login_container}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              LoginContainerView());

    case '${RoutePaths.shop_info_container}':
      final Object? args = settings.arguments;
      final String shopId = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopInfoContainerView(shopId: shopId));

    case '${RoutePaths.searchItemList}':
      final Object? args = settings.arguments;
      final ProductParameterHolder productParameterHolder =
          args as ProductParameterHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SearchItemListView(
                  productParameterHolder: productParameterHolder));

    case '${RoutePaths.shopbranchContainer}':
      final Object? args = settings.arguments;
      // final String shopId = args as String;
      // final ShopInfo shopInfo = args as ShopInfo;
      final ShopInfoDataIntentHolder shopInfoDataIntentHolder =
          args as ShopInfoDataIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopBranchContainerView(
                shopInfo: shopInfoDataIntentHolder.shopInfo!,
                shopId: shopInfoDataIntentHolder.shopId!,
              ));

    case '${RoutePaths.contactUs}':
      return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => ContactUsContainerView());

    case '${RoutePaths.searchHistory}':
      return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => SearchHistoryListView());

    case '${RoutePaths.createreservationContainer}':
      final Object? args = settings.arguments;
      final ShopDataIntentHolder shopDataIntentHolder =
          args as ShopDataIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CreateReservationContainerView(
                shopId: shopDataIntentHolder.shopId,
                shopName: shopDataIntentHolder.shopName,
              ));
    case '${RoutePaths.appinfo}':
      return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => AppInfoView());

    case '${RoutePaths.more}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final String userName = args as String;
        return MoreContainerView(userName: userName);
      });

    case '${RoutePaths.reservationlist}':
      return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => ReservationListContainerView());

    case '${RoutePaths.mapPin}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final MapPinIntentHolder mapPinIntentHolder =
            args as MapPinIntentHolder;
        return MapPinView(
          flag: mapPinIntentHolder.flag,
          maplat: mapPinIntentHolder.mapLat,
          maplng: mapPinIntentHolder.mapLng,
        );
      });

    case '${RoutePaths.user_verify_email_container}':
      final Object? args = settings.arguments;
      final String userId = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              VerifyEmailContainerView(userId: userId));

    case '${RoutePaths.user_forgot_password_container}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ForgotPasswordContainerView());

    case '${RoutePaths.user_phone_signin_container}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              PhoneSignInContainerView());

    case '${RoutePaths.user_phone_verify_container}':
      final Object? args = settings.arguments;

      final VerifyPhoneIntentHolder verifyPhoneIntentParameterHolder =
          args as VerifyPhoneIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              VerifyPhoneContainerView(
                userName: verifyPhoneIntentParameterHolder.userName,
                phoneNumber: verifyPhoneIntentParameterHolder.phoneNumber,
                phoneId: verifyPhoneIntentParameterHolder.phoneId,
              ));

    case '${RoutePaths.user_update_password}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ChangePasswordView());

    case '${RoutePaths.languageList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              LanguageListView());

    case '${RoutePaths.categoryList}':
      final Object? args = settings.arguments;
      final String title = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CategoryListViewContainerView(appBarTitle: title));

    case '${RoutePaths.notiList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const NotiListView());

    case '${RoutePaths.billingTo}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final BillingToIntentHolder billingToIntentHolder =
            args as BillingToIntentHolder;
        return BillingToView(
          userEmail: billingToIntentHolder.userEmail,
          userPhoneNo: billingToIntentHolder.userPhoneNo,
        );
      });

    case '${RoutePaths.orderTime}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final OrderTimeIntentHolder orderTimeIntentHolder =
            args as OrderTimeIntentHolder;
        return OrderTimeView(
          userProvider: orderTimeIntentHolder.userProvider,
          shopInfoProvider: orderTimeIntentHolder.shopInfoProvider!,
        );
      });

    case '${RoutePaths.orderLocation}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final DeliveryLocationIntentHolder deliveryLocationIntentHolder =
            args as DeliveryLocationIntentHolder;
        return DeliveryLocationView(
          address: deliveryLocationIntentHolder.address!,
          basketList: deliveryLocationIntentHolder.basketList!,
          deliveryCostProvider:
              deliveryLocationIntentHolder.deliveryCostProvider!,
          userProvider: deliveryLocationIntentHolder.userProvider!,
          shopInfoProvider: deliveryLocationIntentHolder.shopInfoProvider!,
        );
      });

    case '${RoutePaths.paymentMethod}':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final PaymentIntentHolder holder = args as PaymentIntentHolder;
        return PaymentMethodView(
          userProvider: holder.userProvider,
        );
      });

    case '${RoutePaths.creditCard}':
      final Object? args = settings.arguments;

      final CreditCardIntentHolder creditCardParameterHolder =
          args as CreditCardIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CreditCardView(
                basketList: creditCardParameterHolder.basketList,
                couponDiscount: creditCardParameterHolder.couponDiscount,
                transactionSubmitProvider:
                    creditCardParameterHolder.transactionSubmitProvider,
                userLoginProvider: creditCardParameterHolder.userProvider,
                basketProvider: creditCardParameterHolder.basketProvider,
                psValueHolder: creditCardParameterHolder.psValueHolder,
                memoText: creditCardParameterHolder.memoText,
                publishKey: creditCardParameterHolder.publishKey,
                isClickPickUpButton:
                    creditCardParameterHolder.isClickPickUpButton,
                deliveryPickUpDate:
                    creditCardParameterHolder.deliveryPickUpDate,
                deliveryPickUpTime:
                    creditCardParameterHolder.deliveryPickUpTime,
              ));

    // case '${RoutePaths.paystack}':
    //   final Object? args = settings.arguments;

    //   final PayStackInterntHolder payStackInterntHolder =
    //       args as PayStackInterntHolder;
    //   return PageRouteBuilder<dynamic>(
    //       pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
    //           PayStackView(
    //             basketList: payStackInterntHolder.basketList,
    //             couponDiscount: payStackInterntHolder.couponDiscount,
    //             transactionSubmitProvider:
    //                 payStackInterntHolder.transactionSubmitProvider,
    //             userLoginProvider: payStackInterntHolder.userLoginProvider,
    //             basketProvider: payStackInterntHolder.basketProvider,
    //             psValueHolder: payStackInterntHolder.psValueHolder,
    //             memoText: payStackInterntHolder.memoText,
    //             paystackKey: payStackInterntHolder.paystackKey,
    //             isClickPickUpButton: payStackInterntHolder.isClickPickUpButton,
    //             deliveryPickUpDate: payStackInterntHolder.deliveryPickUpDate,
    //             deliveryPickUpTime: payStackInterntHolder.deliveryPickUpTime,
    //           ));

    case '${RoutePaths.notiSetting}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              NotificationSettingView());
    case '${RoutePaths.setting}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SettingContainerView());
    //case '${RoutePaths.subCategoryList}':
    //final Object? args = settings.arguments;
    //final Category category = args as Category;
    //return PageRouteBuilder<dynamic>(
    //pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
    // SubCategoryListView(category: category));

    case '${RoutePaths.subCategoryGrid}':
      return MaterialPageRoute<Category>(builder: (BuildContext context) {
        final Object? args = settings.arguments;
        final Category category = args as Category;
        return SubCategoryGridView(category: category);
      });

    case '${RoutePaths.noti}':
      final Object? args = settings.arguments;
      final Noti noti = args as Noti;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              NotiView(noti: noti));

    case '${RoutePaths.filterProductList}':
      final Object? args = settings.arguments;
      final ProductListIntentHolder productListIntentHolder =
          args as ProductListIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ProductListWithFilterContainerView(
                  appBarTitle: productListIntentHolder.appBarTitle,
                  productParameterHolder:
                      productListIntentHolder.productParameterHolder));

    case '${RoutePaths.dashboardsearchFood}':
      final Object? args = settings.arguments;
      final ProductListIntentHolder productListIntentHolder =
          args as ProductListIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              HomeItemSearchContainerView(
                  // appBarTitle: productListIntentHolder.appBarTitle,
                  productParameterHolder:
                      productListIntentHolder.productParameterHolder));
    case '${RoutePaths.shopList}':
      final Object? args = settings.arguments;
      final ShopListIntentHolder shopListIntentHolder =
          args as ShopListIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopListView(
                  appBarTitle: shopListIntentHolder.appBarTitle,
                  shopParameterHolder:
                      shopListIntentHolder.shopParameterHolder));

    case '${RoutePaths.searchCategoryViewAll}':
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>;
      final String title = args!['title'];
      final String keyword = args['keyword'];
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SearchCategoryViewAllContainer(
                  appBarTitle: title, keyword: keyword));

    case '${RoutePaths.searchSubCategoryViewAll}':
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>;
      final String title = args!['title'];
      final String keyword = args['keyword'];
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SearchSubCategoryViewAllContainer(
                  appBarTitle: title, keyword: keyword));

    case '${RoutePaths.searchShopViewAll}':
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>;
      final String title = args!['title'];
      final String keyword = args['keyword'];
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SearchShopViewAllContainer(appBarTitle: title, keyword: keyword));

    case '${RoutePaths.searchItemViewAll}':
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>;
      final String title = args!['title'];
      final String keyword = args['keyword'];
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SearchItemViewAllContainer(appBarTitle: title, keyword: keyword));

    case '${RoutePaths.checkoutSuccessSchedule}':
      final Object? args = settings.arguments;

      final ScheduleCheckoutStatusIntentHolder
          checkoutStatusScheduleIntentHolder =
          args as ScheduleCheckoutStatusIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ScheduleCheckoutStatusView(
                scheduleHeader:
                    checkoutStatusScheduleIntentHolder.scheduleHeader,
              ));

    case '${RoutePaths.scheduleTransactionDetail}':
      final Object? args = settings.arguments;
      final ScheduleHeader scheduleHeader = args as ScheduleHeader;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ScheduleTransactionItemListView(
                scheduleHeader: scheduleHeader,
              ));

    case '${RoutePaths.reservationshopList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ReservationShopListView());

    case '${RoutePaths.checkoutSuccess}':
      final Object? args = settings.arguments;

      final CheckoutStatusIntentHolder checkoutStatusIntentHolder =
          args as CheckoutStatusIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CheckoutStatusView(
                transactionHeader: checkoutStatusIntentHolder.transactionHeader,
              ));

    case '${RoutePaths.privacyPolicy}':
      final Object? args = settings.arguments;
      final PrivacyPolicyIntentHolder privacyPolicyIntentHolder =
          args as PrivacyPolicyIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SettingPrivacyPolicyView(
                  title: privacyPolicyIntentHolder.title,
                  description: privacyPolicyIntentHolder.description));

    case '${RoutePaths.blogList}':
      final Object? args = settings.arguments;
      final BlogIntentHolder blogIntentHolder = args as BlogIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              BlogListContainerView(
                noBlogListForShop: blogIntentHolder.noBlogListForShop,
                shopId: blogIntentHolder.shopId,
              ));

    case '${RoutePaths.blogDetail}':
      final Object? args = settings.arguments;
      final Blog blog = args as Blog;
      return MaterialPageRoute<Widget>(builder: (BuildContext context) {
        return BlogView(
          blog: blog,
          heroTagImage: blog.id!,
        );
      });

    case '${RoutePaths.transactionList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              TransactionListContainerView());

    case '${RoutePaths.scheduleOrder}':
      final Object? args = settings.arguments;
      final User user = args as User;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ScheduleOrderListView(user: user));

    case '${RoutePaths.historyList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              HistoryListContainerView());

    case '${RoutePaths.transactionDetail}':
      final Object? args = settings.arguments;
      final TransactionHeader transaction = args as TransactionHeader;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              TransactionItemListView(
                transaction: transaction,
              ));

    case '${RoutePaths.productDetail}':
      final Object? args = settings.arguments;
      final ProductDetailIntentHolder holder =
          args as ProductDetailIntentHolder;
      return MaterialPageRoute<Widget>(builder: (BuildContext context) {
        return ProductDetailView(
          productId: holder.productId,
          heroTagImage: holder.heroTagImage,
          heroTagTitle: holder.heroTagTitle,
          heroTagOriginalPrice: holder.heroTagOriginalPrice,
          heroTagUnitPrice: holder.heroTagUnitPrice,
          intentId: holder.id,
          intentQty: holder.qty,
          intentSelectedColorId: holder.selectedColorId,
          intentSelectedColorValue: holder.selectedColorValue,
          intentBasketPrice: holder.basketPrice,
          intentBasketSelectedAttributeList: holder.basketSelectedAttributeList,
          intentBasketSelectedAddOnList: holder.basketSelectedAddOnList,
        );
      });

    case '${RoutePaths.filterExpantion}':
      final dynamic args = settings.arguments;

      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              FilterListView(selectedData: args));

    case '${RoutePaths.commentList}':
      final Object? args = settings.arguments;
      final Product product = args as Product;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CommentListView(product: product));

    case '${RoutePaths.itemSearch}':
      final Object? args = settings.arguments;
      final ProductParameterHolder productParameterHolder =
          args as ProductParameterHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ItemSearchView(productParameterHolder: productParameterHolder));

    case '${RoutePaths.itemSort}':
      final Object? args = settings.arguments;
      final ProductParameterHolder productParameterHolder =
          args as ProductParameterHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ItemSortingView(productParameterHolder: productParameterHolder));

    case '${RoutePaths.commentDetail}':
      final Object? args = settings.arguments;
      final CommentHeader commentHeader = args as CommentHeader;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CommentDetailListView(
                commentHeader: commentHeader,
              ));

    case '${RoutePaths.favouriteProductList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              FavouriteProductListContainerView());

    case '${RoutePaths.collectionProductList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CollectionHeaderListContainerView());

    case '${RoutePaths.productListByCollectionId}':
      final Object? args = settings.arguments;
      final ProductListByCollectionIdView productCollectionIdView =
          args as ProductListByCollectionIdView;

      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ProductListByCollectionIdView(
                productCollectionHeader:
                    productCollectionIdView.productCollectionHeader,
                appBarTitle: productCollectionIdView.appBarTitle,
              ));

    case '${RoutePaths.bestChoiceListByCollectionId}':
      final Object? args = settings.arguments;
      final BestChoiceListByCollectionIdView bestChoiceListByCollectionIdView =
          args as BestChoiceListByCollectionIdView;

      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              BestChoiceListByCollectionIdView(
                bestChoice: bestChoiceListByCollectionIdView.bestChoice,
                appBarTitle: bestChoiceListByCollectionIdView.appBarTitle,
                backgroundColor:
                    bestChoiceListByCollectionIdView.backgroundColor,
                titleTextColor: bestChoiceListByCollectionIdView.titleTextColor,
              ));

    case '${RoutePaths.ratingList}':
      final Object? args = settings.arguments;
      final String productDetailId = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              RatingListView(productDetailid: productDetailId));

    case '${RoutePaths.shopRatingList}':
      final Object? args = settings.arguments;
      final String shopInfoId = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopRatingListView(shopInfoId: shopInfoId));

    case '${RoutePaths.editProfile}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              EditProfileView());

    case '${RoutePaths.areaList}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              AreaListView());

    case '${RoutePaths.galleryGrid}':
      final Object? args = settings.arguments;
      final Product product = args as Product;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              GalleryGridView(product: product));

    case '${RoutePaths.shopGalleryGrid}':
      final Object? args = settings.arguments;
      final ShopInfo shopInfo = args as ShopInfo;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              ShopGalleryGridView(shopInfo: shopInfo));

    case '${RoutePaths.galleryDetail}':
      final Object? args = settings.arguments;
      final DefaultPhoto selectedDefaultImage = args as DefaultPhoto;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              GalleryView(selectedDefaultImage: selectedDefaultImage));

    case '${RoutePaths.searchCategory}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CategoryFilterListView());
    case '${RoutePaths.searchSubCategory}':
      final Object? args = settings.arguments;
      final String category = args as String;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              SubCategorySearchListView(categoryId: category));

    case '${RoutePaths.basketList}':
      return MaterialPageRoute<Widget>(builder: (BuildContext context) {
        return const BasketListContainerView();
      });

    case '${RoutePaths.checkout_container}':
      final Object? args = settings.arguments;

      final CheckoutIntentHolder checkoutIntentHolder =
          args as CheckoutIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              CheckoutContainerView(
                basketList: checkoutIntentHolder.basketList!,
              ));

    case '${RoutePaths.onepage_checkout_container}':
      final Object? args = settings.arguments;

      final CheckoutIntentHolder checkoutIntentHolder =
          args as CheckoutIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              OnePageCheckoutContainerView(
                basketList: checkoutIntentHolder.basketList,
                shopInfoProvider: checkoutIntentHolder.shopInfoProvider,
              ));

    case '${RoutePaths.whatsAppCheckout_container}':
      final Object? args = settings.arguments;

      final WhatsAppCheckoutIntentHolder whatsAppCheckoutIntentHolder =
          args as WhatsAppCheckoutIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              WhatsappCheckoutContainerView(
                basketList: whatsAppCheckoutIntentHolder.basketList!,
              ));

    case '${RoutePaths.attributeDetailList}':
      final Object? args = settings.arguments;
      final AttributeDetailIntentHolder attributeDetailIntentHolder =
          args as AttributeDetailIntentHolder;
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              AttributeDetailListView(
                customizedDetailList:
                    attributeDetailIntentHolder.attributeDetail,
                product: attributeDetailIntentHolder.product,
              ));

    case '${RoutePaths.nearestShopGoogleMap}':
      final Object? args = settings.arguments;
      final GoogleMap.LatLng latlng = args as GoogleMap.LatLng;

      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              NearestShopGoogleMapView(
                latLng: latlng,
              ));

    case '${RoutePaths.nearestShopMap}':
      final Object? args = settings.arguments;
      final LatLng latlng = args as LatLng;

      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              NearestShopView(
                latLng: latlng,
              ));

    case '${RoutePaths.qrScanner}':
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              Text("lofasz"));
    default:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              AppInfoView());
  }
}
