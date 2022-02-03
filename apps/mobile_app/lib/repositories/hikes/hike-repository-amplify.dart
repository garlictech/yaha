import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/models/ModelProvider.dart';
import 'hike-repository.dart';

class HikeRepositoryAmplify implements HikeRepository {
  @override
  getHikeList() async {
    try {
      // Todo: wait for proper amplify initialization
      await Future.delayed(const Duration(seconds: 2));
      final h = await Amplify.DataStore.query(Hike.classType);
      return h;
    } on DataStoreException catch (e) {
      debugPrint('Hike query failed: $e');
      throw ('Hike query failed: $e');
    }
  }
}

final hikeRepository = Provider<HikeRepository>(
  (ref) => HikeRepositoryAmplify(),
);
