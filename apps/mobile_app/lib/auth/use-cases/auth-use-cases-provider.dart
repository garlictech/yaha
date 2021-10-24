import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/oauth2-state.dart';
import 'auth-use-cases-oauth2.dart';
import 'auth-use-cases.dart';

final authUseCasesProvider = Provider<AuthUseCases>((ref) {
  final oAuth2StateNotifier = ref.watch(oAuth2StateProvider.notifier);
  return AuthUseCasesOAuth2(oAuth2StateNotifier: oAuth2StateNotifier);
});
