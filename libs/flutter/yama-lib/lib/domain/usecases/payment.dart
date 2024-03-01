import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_lib/data/auth/user_email.dart';
import 'package:yama_lib/domain/states/payment_state.dart';

part 'payment.g.dart';

class PaymentException {
  final String message;

  PaymentException(this.message);
}

@riverpod
class Payment extends _$Payment {
  @override
  PaymentState build() {
    return PaymentState(status: PaymentStatus.initial);
  }

  startPayment() {
    state = state.copyWith(status: PaymentStatus.initial);
  }

  Future<String> executePayment() {
    return initPaymentSheet();
  }

  Future<String> initPaymentSheet() async {
    try {
      // 1. create payment intent on the server
      final data = await _createPaymentSheet();
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            // Main params
            paymentIntentClientSecret: data['paymentIntent'],
            merchantDisplayName: '6Days',
            // Customer params
            customerId: data['customer'],
            customerEphemeralKeySecret: data['ephemeralKey'],
            // Extra params
            primaryButtonLabel: 'Pay now',
            applePay: const PaymentSheetApplePay(
              merchantCountryCode: 'HU',
            ),
            billingDetailsCollectionConfiguration:
                const BillingDetailsCollectionConfiguration(
                    address: AddressCollectionMode.full)
            /*
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'DE',
            testEnv: true,
          ),*/
            /* style: ThemeMode.dark,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              background: Colors.lightBlue,
              primary: Colors.blue,
              componentBorder: Colors.red,
            ),
            shapes: PaymentSheetShape(
              borderWidth: 4,
              shadow: PaymentSheetShadowParams(color: Colors.red),
            ),
            primaryButton: PaymentSheetPrimaryButtonAppearance(
              shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: Color.fromARGB(255, 231, 235, 30),
                  text: Color.fromARGB(255, 235, 92, 30),
                  border: Color.fromARGB(255, 235, 92, 30),
                ),
              ),
            ),
          ),*/
            ),
      );
      await Stripe.instance.presentPaymentSheet();
      final String? paymentId = data['paymentId'];

      if (paymentId == null) {
        throw PaymentException("Did not receive payment id");
      }

      return paymentId;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _createPaymentSheet() async {
    final email = ref.read(userEmailProvider);

    final response = await FirebaseFunctions.instance
        .httpsCallable('yamaStripePaymentSheet')({'email': email});
    return response.data;
  }
}
