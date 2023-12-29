import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';

final onroutePoisProvider =
    FutureProvider.family<List<PoiEntity>, String>((ref, hikeId) async {
  return ref.watch(trackRepositoryProvider).getOnroutePois(hikeId);
});
