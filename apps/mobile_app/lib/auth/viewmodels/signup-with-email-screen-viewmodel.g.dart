// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup-with-email-screen-viewmodel.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $SignupWithEmailViewmodel {
  const $SignupWithEmailViewmodel();

  String get password;
  String get passwordAgain;

  SignupWithEmailViewmodel copyWith({
    String? password,
    String? passwordAgain,
  }) =>
      SignupWithEmailViewmodel(
        password: password ?? this.password,
        passwordAgain: passwordAgain ?? this.passwordAgain,
      );

  SignupWithEmailViewmodel copyUsing(
      void Function(SignupWithEmailViewmodel$Change change) mutator) {
    final change = SignupWithEmailViewmodel$Change._(
      this.password,
      this.passwordAgain,
    );
    mutator(change);
    return SignupWithEmailViewmodel(
      password: change.password,
      passwordAgain: change.passwordAgain,
    );
  }

  @override
  String toString() =>
      "SignupWithEmailViewmodel(password: $password, passwordAgain: $passwordAgain)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SignupWithEmailViewmodel &&
      other.runtimeType == runtimeType &&
      password == other.password &&
      passwordAgain == other.passwordAgain;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + password.hashCode;
    result = 37 * result + passwordAgain.hashCode;
    return result;
  }
}

class SignupWithEmailViewmodel$Change {
  SignupWithEmailViewmodel$Change._(
    this.password,
    this.passwordAgain,
  );

  String password;
  String passwordAgain;
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
}
