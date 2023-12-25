import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/data/data.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

final poiRepositoryProvider = Provider<PoiRepository>(
  (ref) => PoiRepositoryNeo4j(ref: ref),
);
