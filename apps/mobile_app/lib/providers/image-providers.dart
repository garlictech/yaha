import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/data.dart';
import 'package:yaha/domain/domain.dart';

final imageRepositoryProvider = Provider<ImageRepository>(
  (ref) => ImageRepositoryAmplify(),
);

final imageUsecasesProvider = Provider<ImageUsecases>(
  (ref) => ImageUsecasesImpl(ref: ref),
);
