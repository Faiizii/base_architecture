import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentManager {
  static final PaymentManager _instance = PaymentManager._();
  PaymentManager._();
  factory PaymentManager() => _instance;

  Future<String?> createStripeToken(CardDetails card) async {
    await Stripe.instance.dangerouslyUpdateCardDetails(card);
    try{
      //following is the mock details.
      const billingDetails = BillingDetails(
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );

      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: const PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
              billingDetails: billingDetails,
            ),
          ));

      // this token will be send to backend
      // backend will create the payment intent
      // and complete the payment on the basis of the payment intent id
      return paymentMethod.id;
    }catch (e){
      //handle exception
      return null;
    }
  }
}