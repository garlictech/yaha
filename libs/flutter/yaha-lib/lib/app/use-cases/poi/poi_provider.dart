import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';

final poiProvider =
    FutureProvider.family<PoiEntity, String>((ref, poiId) async {
  return ref.read(poiRepositoryProvider).getPoi(poiId);
});
