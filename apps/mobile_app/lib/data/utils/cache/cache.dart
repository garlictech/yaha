import 'cache_item.dart';

class DataCache {
  final Map<String, CacheItem> _cache = {};

  bool containsKey(dynamic key) {
    return _cache.containsKey(key);
  }

  void addData(dynamic key, dynamic data) {
    if (containsKey(key)) {
      _cache[key]!.data = data;
    } else {
      _cache[key] = CacheItem(key: key, data: data);
    }
  }

  getData(dynamic key) {
    if (containsKey(key)) {
      return _cache[key]!.data;
    }
    return null;
  }

  reset() {
    _cache.clear();
  }
}
