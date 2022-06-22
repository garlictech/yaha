// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup-with-email-screen-viewmodel.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SignupWithEmailViewmodel {
  const $SignupWithEmailViewmodel();

  String get password;
  String get passwordAgain;
  bool get termsAccepted;

  SignupWithEmailViewmodel copyWith({
    String? password,
    String? passwordAgain,
    bool? termsAccepted,
  }) =>
      SignupWithEmailViewmodel(
        password: password ?? this.password,
        passwordAgain: passwordAgain ?? this.passwordAgain,
        termsAccepted: termsAccepted ?? this.termsAccepted,
      );

  SignupWithEmailViewmodel copyUsing(
      void Function(SignupWithEmailViewmodel$Change change) mutator) {
    final change = SignupWithEmailViewmodel$Change._(
      this.password,
      this.passwordAgain,
      this.termsAccepted,
    );
    mutator(change);
    return SignupWithEmailViewmodel(
      password: change.password,
      passwordAgain: change.passwordAgain,
      termsAccepted: change.termsAccepted,
    );
  }

  @override
  String toString() =>
      "SignupWithEmailViewmodel(password: $password, passwordAgain: $passwordAgain, termsAccepted: $termsAccepted)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SignupWithEmailViewmodel &&
      other.runtimeType == runtimeType &&
      password == other.password &&
      passwordAgain == other.passwordAgain &&
      termsAccepted == other.termsAccepted;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + password.hashCode;
    result = 37 * result + passwordAgain.hashCode;
    result = 37 * result + termsAccepted.hashCode;
    return result;
  }
}

class SignupWithEmailViewmodel$Change {
  SignupWithEmailViewmodel$Change._(
    this.password,
    this.passwordAgain,
    this.termsAccepted,
  );

  String password;
  String passwordAgain;
  bool termsAccepted;
}

// ignore: avoid_classes_with_only_static_members
class SignupWithEmailViewmodel$ {
  static final password = Lens<SignupWithEmailViewmodel, String>(
    (passwordContainer) => passwordContainer.password,
    (passwordContainer, password) =>
        passwordContainer.copyWith(password: password),
  );

  static final passwordAgain = Lens<SignupWithEmailViewmodel, String>(
    (passwordAgainContainer) => passwordAgainContainer.passwordAgain,
    (passwordAgainContainer, passwordAgain) =>
        passwordAgainContainer.copyWith(passwordAgain: passwordAgain),
  );

  static final termsAccepted = Lens<SignupWithEmailViewmodel, bool>(
    (termsAcceptedContainer) => termsAcceptedContainer.termsAccepted,
    (termsAcceptedContainer, termsAccepted) =>
        termsAcceptedContainer.copyWith(termsAccepted: termsAccepted),
  );
}
