// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth-state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $AuthState {
  const $AuthState();

  String? get error;
  bool get working;
  bool get loggedIn;
  bool get termsAccepted;

  AuthState copyWith({
    String? error,
    bool? working,
    bool? loggedIn,
    bool? termsAccepted,
  }) =>
      AuthState(
        error: error ?? this.error,
        working: working ?? this.working,
        loggedIn: loggedIn ?? this.loggedIn,
        termsAccepted: termsAccepted ?? this.termsAccepted,
      );

  AuthState copyUsing(void Function(AuthState$Change change) mutator) {
    final change = AuthState$Change._(
      this.error,
      this.working,
      this.loggedIn,
      this.termsAccepted,
    );
    mutator(change);
    return AuthState(
      error: change.error,
      working: change.working,
      loggedIn: change.loggedIn,
      termsAccepted: change.termsAccepted,
    );
  }

  @override
  String toString() =>
      "AuthState(error: $error, working: $working, loggedIn: $loggedIn, termsAccepted: $termsAccepted)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is AuthState &&
      other.runtimeType == runtimeType &&
      error == other.error &&
      working == other.working &&
      loggedIn == other.loggedIn &&
      termsAccepted == other.termsAccepted;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + error.hashCode;
    result = 37 * result + working.hashCode;
    result = 37 * result + loggedIn.hashCode;
    result = 37 * result + termsAccepted.hashCode;
    return result;
  }
}

class AuthState$Change {
  AuthState$Change._(
    this.error,
    this.working,
    this.loggedIn,
    this.termsAccepted,
  );

  String? error;
  bool working;
  bool loggedIn;
  bool termsAccepted;
}

// ignore: avoid_classes_with_only_static_members
class AuthState$ {
  static final error = Lens<AuthState, String?>(
    (errorContainer) => errorContainer.error,
    (errorContainer, error) => errorContainer.copyWith(error: error),
  );

  static final working = Lens<AuthState, bool>(
    (workingContainer) => workingContainer.working,
    (workingContainer, working) => workingContainer.copyWith(working: working),
  );

  static final loggedIn = Lens<AuthState, bool>(
    (loggedInContainer) => loggedInContainer.loggedIn,
    (loggedInContainer, loggedIn) =>
        loggedInContainer.copyWith(loggedIn: loggedIn),
  );

  static final termsAccepted = Lens<AuthState, bool>(
    (termsAcceptedContainer) => termsAcceptedContainer.termsAccepted,
    (termsAcceptedContainer, termsAccepted) =>
        termsAcceptedContainer.copyWith(termsAccepted: termsAccepted),
  );
}
