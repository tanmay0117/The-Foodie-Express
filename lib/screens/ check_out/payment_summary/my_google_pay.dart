import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  // String amount;
  // MyGooglePay({required this.amount});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  var _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

// In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server or PSP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Pay"),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          height: 60,
          width: 220,
          child: GooglePayButton(
            paymentConfigurationAsset: 'sample_payment_configuration.json',
            paymentItems: _paymentItems,
            // style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            onPaymentResult: onGooglePayResult,
            height: 50,
            width: 200,
          ),
        ),
      ),
    );
  }
}
