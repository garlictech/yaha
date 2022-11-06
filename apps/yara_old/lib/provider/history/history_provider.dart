import 'dart:async';
import 'package:yara/api/common/ps_resource.dart';
import 'package:yara/api/common/ps_status.dart';
import 'package:yara/provider/common/ps_provider.dart';
import 'package:yara/repository/history_repsitory.dart';
import 'package:yara/utils/utils.dart';
import 'package:yara/viewobject/common/ps_value_holder.dart';
import 'package:yara/viewobject/product.dart';

class HistoryProvider extends PsProvider {
  HistoryProvider({
    required HistoryRepository? repo,
    required this.psValueHolder, 
    int limit = 0})
      : super(repo, limit) {
    _repo = repo;
    print('History Provider: $hashCode');

    historyListStream = StreamController<PsResource<List<Product>>>.broadcast();
    subscription =
        historyListStream.stream.listen((PsResource<List<Product>> resource) {
      updateOffset(resource.data!.length);

      _historyList = resource;

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
  HistoryRepository? _repo;

  PsResource<List<Product>> _historyList =
      PsResource<List<Product>>(PsStatus.NOACTION, '', <Product>[]);

  PsResource<List<Product>> get historyList => _historyList;
 late StreamSubscription<PsResource<List<Product>>> subscription;
late  StreamController<PsResource<List<Product>>> historyListStream;
  @override
  void dispose() {
    subscription.cancel();
    isDispose = true;
    print('History Provider Dispose: $hashCode');
    super.dispose();
  }

  Future<dynamic> loadHistoryList() async {
    isLoading = true;
    await _repo!.getAllHistoryList(historyListStream, PsStatus.PROGRESS_LOADING);
  }

  Future<dynamic> addHistoryList(Product product) async {
    isLoading = true;
    await _repo!.addAllHistoryList(
        historyListStream, PsStatus.PROGRESS_LOADING, product);
  }

  Future<void> resetHistoryList() async {
    isConnectedToInternet = await Utils.checkInternetConnectivity();
    isLoading = true;

    updateOffset(0);

    await _repo!.getAllHistoryList(historyListStream, PsStatus.PROGRESS_LOADING);

    isLoading = false;
  }
}
