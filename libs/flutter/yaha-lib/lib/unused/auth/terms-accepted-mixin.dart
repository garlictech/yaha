import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/states/auth/auth-state.dart';

mixin TermsAccepted {
  late final Ref _ref;
  get ref => _ref;
  set ref(r) => _ref = r;

  bool get termsAccepted => _ref.read(authStateProvider).termsAccepted;
  set termsAccepted(bool? accepted) =>
      _ref.read(authStateProvider.notifier).setTermsAccepted(accepted ?? false);
}
