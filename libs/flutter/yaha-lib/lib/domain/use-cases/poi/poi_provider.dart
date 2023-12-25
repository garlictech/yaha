import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/providers.dart';

import '../../entities/poi/poi.dart';

final poiProvider = FutureProvider.family<Poi, String>((ref, poiId) async {
  return ref.read(poiRepositoryProvider).getPoi(poiId);
});
