import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/data/data.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

final trackRepositoryProvider = Provider<TrackRepository>(
  (ref) => HikeRepositoryNeo4j(ref: ref),
);
