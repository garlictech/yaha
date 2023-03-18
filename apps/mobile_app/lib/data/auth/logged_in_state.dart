import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_state.g.dart';

@riverpod
class LoggedInState extends _$LoggedInState {
  @override
  bool build() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = user != null;
      debugPrint("****1 $state");
    });

    return false;
  }
}
