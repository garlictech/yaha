import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/use-cases/use-cases.dart';

final geolocationUsecasesProvider = Provider<GeolocationUsecases>((ref) {
  return GeolocationUsecases(ref: ref);
});

final hikeSearchUsecasesProvider = Provider<HikeSearchUsecases>((ref) {
  return HikeSearchUsecases(ref: ref);
});
