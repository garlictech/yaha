import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/product_repository.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/holder/product_parameter_holder.dart';
import 'package:yara/viewobject/product.dart';

class SearchProductProvider extends PsProvider {
  SearchProductProvider({
    required ProductRepository repo, 
    required this.psValueHolder,
    int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('SearchProductProvider : $hashCode');
    Utils.checkInternetConnectivity().then((bool onValue) {
      isConnectedToInternet = onValue;
    });

    productListStream = StreamController<PsResource<List<Product>>>.broadcast();
    subscription =
        productListStream.stream.listen((PsResource<List<Product>> resource) {
      updateOffset(resource.data!.length);

      _productList = Utils.removeDuplicateObj<Product>(resource);

      if (resource.status != PsStatus.BLOCK_LOADING &&
          resource.status != PsStatus.PROGRESS_LOADING) {
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

  PsValueHolder psValueHolder;
  final ProductParameterHolder latestProductParameterHolder =
      ProductParameterHolder().getLatestParameterHolder();
 late ProductRepository _repo;

  PsResource<List<Product>> _productList =
      PsResource<List<Product>>(PsStatus.NOACTION, '', <Product>[]);

  PsResource<List<Product>> get productList => _productList;
  late StreamSubscription<PsResource<List<Product>>> subscription;
  late StreamController<PsResource<List<Product>>> productListStream;

 late ProductParameterHolder productParameterHolder;

  bool isSwitchedFeaturedProduct = false;
  bool isSwitchedDiscountPrice = false;

  String selectedCategoryName = '';
  String selectedSubCategoryName = '';

  String categoryId = '';
  String subCategoryId = '';

  bool isfirstRatingClicked = false;
  bool isSecondRatingClicked = false;
  bool isThirdRatingClicked = false;
  bool isfouthRatingClicked = false;
  bool isFifthRatingClicked = false;

  @override
  void dispose() {
    subscription.cancel();
    isDispose = true;
    print('Search Product Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadProductListByKey(
      ProductParameterHolder productParameterHolder) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    isLoading = true;
    await _repo.getProductList(productListStream, isConnectedToInternet, limit,
        offset, PsStatus.PROGRESS_LOADING, productParameterHolder);
  }

  Future<dynamic> loadProductListByKeyFromDB(
      ProductParameterHolder productParameterHolder) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    isLoading = true;
    await _repo.getProductListFromDB(productListStream, isConnectedToInternet,
        limit, offset, PsStatus.PROGRESS_LOADING, productParameterHolder);
  }

  Future<dynamic> nextProductListByKey(
      ProductParameterHolder productParameterHolder) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();

    if (!isLoading && !isReachMaxData) {
      super.isLoading = true;
      print('*** Next Page Loading $limit $offset');
      await _repo.getNextPageProductList(
          productListStream,
          isConnectedToInternet,
          limit,
          offset,
          PsStatus.PROGRESS_LOADING,
          productParameterHolder);
    }
  }

  Future<void> resetLatestProductList(
      ProductParameterHolder productParameterHolder) async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();

    updateOffset(0);

    isLoading = true;
    await _repo.getProductList(productListStream, isConnectedToInternet, limit,
        offset, PsStatus.PROGRESS_LOADING, productParameterHolder);
  }
}
