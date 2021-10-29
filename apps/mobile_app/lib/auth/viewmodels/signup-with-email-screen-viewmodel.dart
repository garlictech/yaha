import 'package:functional_data/functional_data.dart';

part 'signup-with-email-screen-viewmodel.g.dart';

@FunctionalData()
class SignupWithEmailViewmodel extends $SignupWithEmailViewmodel {
  String password;
  String passwordAgain;
  final bool termsAccepted;

  SignupWithEmailViewmodel(
      {this.termsAccepted = false,
      this.password = '',
      this.passwordAgain = ''});

  bool get passwordsMatch => password == passwordAgain;
}
