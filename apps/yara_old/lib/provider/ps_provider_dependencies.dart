import 'package:flutter/material.dart';
import 'package:yara/api/ps_api_service.dart';
import 'package:yara/db/about_app_dao.dart';
import 'package:yara/db/basket_dao.dart';
import 'package:yara/db/best_choice_dao.dart';
import 'package:yara/db/blog_dao.dart';
import 'package:yara/db/category_map_dao.dart';
import 'package:yara/db/cateogry_dao.dart';
import 'package:yara/db/comment_detail_dao.dart';
import 'package:yara/db/comment_header_dao.dart';
import 'package:yara/db/common/ps_shared_preferences.dart';
import 'package:yara/db/delivery_boy_rating_dao.dart';
import 'package:yara/db/favourite_product_dao.dart';
import 'package:yara/db/gallery_dao.dart';
import 'package:yara/db/history_dao.dart';
import 'package:yara/db/noti_dao.dart';
import 'package:yara/db/product_collection_header_dao.dart';
import 'package:yara/db/product_dao.dart';
import 'package:yara/db/product_map_dao.dart';
import 'package:yara/db/rating_dao.dart';
import 'package:yara/db/reservation_dao.dart';
import 'package:yara/db/search_history_dao.dart';
import 'package:yara/db/search_result_dao.dart';
import 'package:yara/db/shipping_area_dao.dart';
import 'package:yara/db/shop_dao.dart';
import 'package:yara/db/shop_info_dao.dart';
import 'package:yara/db/shop_map_dao.dart';
import 'package:yara/db/shop_rating_dao.dart';
import 'package:yara/db/sub_category_dao.dart';
import 'package:yara/db/transaction_detail_dao.dart';
import 'package:yara/db/transaction_header_dao.dart';
import 'package:yara/db/transaction_status_dao.dart';
import 'package:yara/db/user_dao.dart';
import 'package:yara/db/user_login_dao.dart';
import 'package:yara/repository/Common/notification_repository.dart';
import 'package:yara/repository/about_app_repository.dart';
import 'package:yara/repository/app_info_repository.dart';
import 'package:yara/repository/basket_repository.dart';
import 'package:yara/repository/best_choice_repository.dart';
import 'package:yara/repository/blog_repository.dart';
import 'package:yara/repository/category_repository.dart';
import 'package:yara/repository/clear_all_data_repository.dart';
import 'package:yara/repository/comment_detail_repository.dart';
import 'package:yara/repository/comment_header_repository.dart';
import 'package:yara/repository/contact_us_repository.dart';
import 'package:yara/repository/coupon_discount_repository.dart';
import 'package:yara/repository/create_reservation_repository.dart';
import 'package:yara/repository/delete_task_repository.dart';
import 'package:yara/repository/delivery_boy_rating_repository.dart';
import 'package:yara/repository/delivery_cost_repository.dart';
import 'package:yara/repository/gallery_repository.dart';
import 'package:yara/repository/history_repsitory.dart';
import 'package:yara/repository/language_repository.dart';
import 'package:yara/repository/noti_repository.dart';
import 'package:yara/repository/product_collection_repository.dart';
import 'package:yara/repository/product_repository.dart';
import 'package:yara/repository/ps_theme_repository.dart';
import 'package:yara/repository/rating_repository.dart';
import 'package:yara/repository/search_history_repository.dart';
import 'package:yara/repository/search_result_repository.dart';
import 'package:yara/repository/shipping_area_repository.dart';
import 'package:yara/repository/shop_info_repository.dart';
import 'package:yara/repository/shop_rating_repository.dart';
import 'package:yara/repository/shop_repository.dart';
import 'package:yara/repository/sub_category_repository.dart';
import 'package:yara/repository/tansaction_detail_repository.dart';
import 'package:yara/repository/token_repository.dart';
import 'package:yara/repository/transaction_header_repository.dart';
import 'package:yara/repository/transaction_status_repository.dart';
import 'package:yara/repository/user_repository.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<PsSharedPreferences>.value(value: PsSharedPreferences.instance),
  Provider<PsApiService>.value(value: PsApiService()),
  Provider<CategoryDao>.value(value: CategoryDao()),
  Provider<SearchResultDao>.value(value: SearchResultDao.instance),
  Provider<CategoryMapDao>.value(value: CategoryMapDao.instance),
  Provider<SubCategoryDao>.value(
      value: SubCategoryDao()), //wrong type not contain instance
  Provider<ProductDao>.value(
      value: ProductDao.instance), //correct type with instance
  Provider<ProductMapDao>.value(value: ProductMapDao.instance),
  Provider<NotiDao>.value(value: NotiDao.instance),
  Provider<ProductCollectionDao>.value(value: ProductCollectionDao.instance),
  Provider<BestChoiceDao>.value(value: BestChoiceDao.instance),
  Provider<ShopInfoDao>.value(value: ShopInfoDao.instance),
  Provider<BlogDao>.value(value: BlogDao.instance),
  Provider<TransactionHeaderDao>.value(value: TransactionHeaderDao.instance),
  Provider<TransactionDetailDao>.value(value: TransactionDetailDao.instance),
  Provider<TransactionStatusDao>.value(value: TransactionStatusDao.instance),
  Provider<UserDao>.value(value: UserDao.instance),
  Provider<UserLoginDao>.value(value: UserLoginDao.instance),
  Provider<CommentHeaderDao>.value(value: CommentHeaderDao.instance),
  Provider<CommentDetailDao>.value(value: CommentDetailDao.instance),
  Provider<RatingDao>.value(value: RatingDao.instance),
  Provider<DeliveryBoyRatingDao>.value(value: DeliveryBoyRatingDao.instance),
  Provider<ShopRatingDao>.value(value: ShopRatingDao.instance),
  Provider<HistoryDao>.value(value: HistoryDao.instance),
  Provider<SearchHistoryDao>.value(value: SearchHistoryDao.instance),
  Provider<GalleryDao>.value(value: GalleryDao.instance),
  Provider<ShippingAreaDao>.value(value: ShippingAreaDao.instance),
  Provider<BasketDao>.value(value: BasketDao.instance),
  Provider<ShopDao>.value(value: ShopDao.instance),
  Provider<AboutAppDao>.value(value: AboutAppDao.instance),
  Provider<ShopMapDao>.value(value: ShopMapDao.instance),
  Provider<FavouriteProductDao>.value(value: FavouriteProductDao.instance),
  Provider<ReservationDao>.value(value: ReservationDao.instance),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  ProxyProvider<PsSharedPreferences, PsThemeRepository>(
    update: (_, PsSharedPreferences ssSharedPreferences,
            PsThemeRepository? psThemeRepository) =>
        PsThemeRepository(psSharedPreferences: ssSharedPreferences),
  ),
  ProxyProvider<PsApiService, AppInfoRepository>(
    update:
        (_, PsApiService psApiService, AppInfoRepository? appInfoRepository) =>
            AppInfoRepository(psApiService: psApiService),
  ),
  ProxyProvider<PsApiService, DeliveryCostRepository>(
    update: (_, PsApiService psApiService,
            DeliveryCostRepository? apiStatusRepository) =>
        DeliveryCostRepository(psApiService: psApiService),
  ),
  ProxyProvider<PsSharedPreferences, LanguageRepository>(
    update: (_, PsSharedPreferences ssSharedPreferences,
            LanguageRepository? languageRepository) =>
        LanguageRepository(psSharedPreferences: ssSharedPreferences),
  ),
  ProxyProvider2<PsApiService, CategoryDao, CategoryRepository>(
    update: (_, PsApiService psApiService, CategoryDao categoryDao,
            CategoryRepository? categoryRepository2) =>
        CategoryRepository(
            psApiService: psApiService, categoryDao: categoryDao),
  ),
  ProxyProvider2<PsApiService, SearchResultDao, SearchResultRepository>(
    update: (_, PsApiService apiService, SearchResultDao searchResultDao,
            SearchResultRepository? searchResultRepository) =>
        SearchResultRepository(
            psApiService: apiService, searchResultDao: searchResultDao)),
  ProxyProvider2<PsApiService, AboutAppDao, AboutAppRepository>(
    update: (_, PsApiService psApiService, AboutAppDao aboutUsDao,
            AboutAppRepository? aboutUsRepository) =>
        AboutAppRepository(psApiService: psApiService, aboutUsDao: aboutUsDao),
  ),
  ProxyProvider2<PsApiService, SubCategoryDao, SubCategoryRepository>(
    update: (_, PsApiService psApiService, SubCategoryDao subCategoryDao,
            SubCategoryRepository? subCategoryRepository) =>
        SubCategoryRepository(
            psApiService: psApiService, subCategoryDao: subCategoryDao),
  ),
  ProxyProvider2<PsApiService, ProductCollectionDao,
      ProductCollectionRepository>(
    update: (_,
            PsApiService psApiService,
            ProductCollectionDao productCollectionDao,
            ProductCollectionRepository? productCollectionRepository) =>
        ProductCollectionRepository(
            psApiService: psApiService,
            productCollectionDao: productCollectionDao),
  ),
  ProxyProvider2<PsApiService, BestChoiceDao,
      BestChoiceRepository>(
    update: (_,
            PsApiService psApiService,
            BestChoiceDao bestChoiceDao,
            BestChoiceRepository? productCollectionRepository) =>
        BestChoiceRepository(
            psApiService: psApiService,
            bestChoiceDao: bestChoiceDao),
  ),
  ProxyProvider2<PsApiService, ShopDao, ShopRepository>(
    update: (_, PsApiService psApiService, ShopDao shopDao,
            ShopRepository? shopRepository) =>
        ShopRepository(psApiService: psApiService, shopDao: shopDao),
  ),
  ProxyProvider2<PsApiService, ProductDao, ProductRepository>(
    update: (_, PsApiService psApiService, ProductDao productDao,
            ProductRepository? categoryRepository2) =>
        ProductRepository(psApiService: psApiService, productDao: productDao),
  ),
  ProxyProvider2<PsApiService, NotiDao, NotiRepository>(
    update: (_, PsApiService psApiService, NotiDao notiDao,
            NotiRepository? notiRepository) =>
        NotiRepository(psApiService: psApiService, notiDao: notiDao),
  ),
  ProxyProvider2<PsApiService, ShopInfoDao, ShopInfoRepository>(
    update: (_, PsApiService psApiService, ShopInfoDao shopInfoDao,
            ShopInfoRepository? shopInfoRepository) =>
        ShopInfoRepository(
            psApiService: psApiService, shopInfoDao: shopInfoDao),
  ),
  ProxyProvider<PsApiService, NotificationRepository>(
    update:
        (_, PsApiService psApiService, NotificationRepository? userRepository) =>
            NotificationRepository(
      psApiService: psApiService,
    ),
  ),
  ProxyProvider3<PsApiService, UserDao, UserLoginDao, UserRepository>(
    update: (_, PsApiService psApiService, UserDao userDao,
            UserLoginDao userLoginDao, UserRepository? userRepository) =>
        UserRepository(
            psApiService: psApiService,
            userDao: userDao,
            userLoginDao: userLoginDao),
  ),
  ProxyProvider<PsApiService, ClearAllDataRepository>(
    update: (_, PsApiService psApiService,
            ClearAllDataRepository? clearAllDataRepository) =>
        ClearAllDataRepository(),
  ),
  ProxyProvider<PsApiService, DeleteTaskRepository>(
    update: (_, PsApiService psApiService,
            DeleteTaskRepository? deleteTaskRepository) =>
        DeleteTaskRepository(),
  ),
  ProxyProvider2<PsApiService, BlogDao, BlogRepository>(
    update: (_, PsApiService psApiService, BlogDao blogDao,
            BlogRepository? blogRepository) =>
        BlogRepository(psApiService: psApiService, blogDao: blogDao),
  ),
  ProxyProvider2<PsApiService, TransactionHeaderDao,
      TransactionHeaderRepository>(
    update: (_,
            PsApiService psApiService,
            TransactionHeaderDao transactionHeaderDao,
            TransactionHeaderRepository? transactionRepository) =>
        TransactionHeaderRepository(
            psApiService: psApiService,
            transactionHeaderDao: transactionHeaderDao),
  ),
  ProxyProvider2<PsApiService, TransactionDetailDao,
      TransactionDetailRepository>(
    update: (_,
            PsApiService psApiService,
            TransactionDetailDao transactionDetailDao,
            TransactionDetailRepository? transactionDetailRepository) =>
        TransactionDetailRepository(
            psApiService: psApiService,
            transactionDetailDao: transactionDetailDao),
  ),
  ProxyProvider2<PsApiService, TransactionStatusDao,
      TransactionStatusRepository>(
    update: (_,
            PsApiService psApiService,
            TransactionStatusDao transactionStatusDao,
            TransactionStatusRepository? transactionStatusRepository) =>
        TransactionStatusRepository(
            psApiService: psApiService,
            transactionStatusDao: transactionStatusDao),
  ),
  ProxyProvider2<PsApiService, CommentHeaderDao, CommentHeaderRepository>(
    update: (_, PsApiService psApiService, CommentHeaderDao commentHeaderDao,
            CommentHeaderRepository? commentHeaderRepository) =>
        CommentHeaderRepository(
            psApiService: psApiService, commentHeaderDao: commentHeaderDao),
  ),
  ProxyProvider2<PsApiService, CommentDetailDao, CommentDetailRepository>(
    update: (_, PsApiService psApiService, CommentDetailDao commentDetailDao,
            CommentDetailRepository? commentHeaderRepository) =>
        CommentDetailRepository(
            psApiService: psApiService, commentDetailDao: commentDetailDao),
  ),
  ProxyProvider2<PsApiService, RatingDao, RatingRepository>(
    update: (_, PsApiService psApiService, RatingDao ratingDao,
            RatingRepository? ratingRepository) =>
        RatingRepository(psApiService: psApiService, ratingDao: ratingDao),
  ),
  ProxyProvider2<PsApiService, DeliveryBoyRatingDao, DeliveryBoyRatingRepository>(
    update: (_, PsApiService psApiService, DeliveryBoyRatingDao ratingDao,
            DeliveryBoyRatingRepository? ratingRepository) =>
        DeliveryBoyRatingRepository(psApiService: psApiService, ratingDao: ratingDao),
  ),
  ProxyProvider2<PsApiService, ShopRatingDao, ShopRatingRepository>(
    update: (_, PsApiService psApiService, ShopRatingDao shopRatingDao,
            ShopRatingRepository? shopRatingRepository) =>
        ShopRatingRepository(
            psApiService: psApiService, shopRatingDao: shopRatingDao),
  ),
  ProxyProvider2<PsApiService, HistoryDao, HistoryRepository>(
    update: (_, PsApiService psApiService, HistoryDao historyDao,
            HistoryRepository? historyRepository) =>
        HistoryRepository(historyDao: historyDao),
  ),
  ProxyProvider2<PsApiService, SearchHistoryDao, SearchHistoryRepository>(
    update: (_, PsApiService psApiService, SearchHistoryDao searchHistoryDao,
            SearchHistoryRepository? historyRepository) =>
        SearchHistoryRepository(searchHistoryDao: searchHistoryDao),
  ),
  ProxyProvider2<PsApiService, GalleryDao, GalleryRepository>(
    update: (_, PsApiService psApiService, GalleryDao galleryDao,
            GalleryRepository? galleryRepository) =>
        GalleryRepository(galleryDao: galleryDao, psApiService: psApiService),
  ),
  ProxyProvider<PsApiService, ContactUsRepository>(
    update: (_, PsApiService psApiService,
            ContactUsRepository? apiStatusRepository) =>
        ContactUsRepository(psApiService: psApiService),
  ),
  ProxyProvider2<PsApiService, BasketDao, BasketRepository>(
    update: (_, PsApiService psApiService, BasketDao basketDao,
            BasketRepository? historyRepository) =>
        BasketRepository(basketDao: basketDao),
  ),
  ProxyProvider2<PsApiService, ShippingAreaDao, ShippingAreaRepository>(
    update: (_, PsApiService psApiService, ShippingAreaDao shippingAreaDao,
            ShippingAreaRepository? shippingAreaRepository) =>
        ShippingAreaRepository(
            psApiService: psApiService, shippingAreaDao: shippingAreaDao),
  ),
  ProxyProvider<PsApiService, CouponDiscountRepository>(
    update: (_, PsApiService psApiService,
            CouponDiscountRepository? couponDiscountRepository) =>
        CouponDiscountRepository(psApiService: psApiService),
  ),
  ProxyProvider<PsApiService, TokenRepository>(
    update: (_, PsApiService psApiService, TokenRepository? tokenRepository) =>
        TokenRepository(psApiService: psApiService),
  ),
  ProxyProvider2<PsApiService, ReservationDao, ReservationRepository>(
    update: (_, PsApiService psApiService, ReservationDao reservationListDao,
            ReservationRepository? apiStatusRepository) =>
        ReservationRepository(
      psApiService: psApiService,
      reservationListDao: reservationListDao,
    ),
  ),
];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[
  StreamProvider<PsValueHolder?>(
    initialData: null,
    create: (BuildContext context) =>
        Provider.of<PsSharedPreferences>(context, listen: false).psValueHolder,
  )
];
