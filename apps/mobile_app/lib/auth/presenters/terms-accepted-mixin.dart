import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/auth/states/auth-state.dart';

mixin TermsAccepted {
  late final ProviderReference _ref;
  get ref => _ref;
  set ref(r) => _ref = r;

  bool get termsAccepted => _ref.read(authStateProvider).termsAccepted;
  set termsAccepted(bool? accepted) =>
      _ref.read(authStateProvider.notifier).setTermsAccepted(accepted ?? false);
}
