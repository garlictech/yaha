import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';

final poiRepositoryProvider = Provider<PoiRepository>(
  (ref) => PoiRepositoryAmplify(),
);

final poiUsecasesProvider = Provider<PoiUsecases>(
  (ref) => PoiUsecasesImpl(ref: ref),
);
