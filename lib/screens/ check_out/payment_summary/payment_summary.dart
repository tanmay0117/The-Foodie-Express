import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/screens/%20check_out/payment_summary/my_google_pay.dart';
import 'package:food_app/screens/%20check_out/payment_summary/single_order_item.dart';
import 'package:food_app/screens/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../../models/delivery_address.dart';

class PaymentSummary extends StatefulWidget {
  DeliveryAddressModel dam;
  PaymentSummary({required this.dam});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.fetchReviewCartData();

    double discount = 30;
    double discountValue = 0.0;
    double shippingCharges = 0.0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      shippingCharges = 10;
    }
    double total = totalPrice - discountValue - shippingCharges;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Payment Summary"),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          '\$ $total',
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text('Place Order'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyGooglePay(),
                ),
              );
            },
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: ListTile(
                title: Center(
                  child: Text(
                    "${widget.dam.firstName} ${widget.dam.lastName}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "${widget.dam.flatNo}, ${widget.dam.building}, ${widget.dam.society}, ${widget.dam.area}, ${widget.dam.pincode},",
                    style: TextStyle(),
                  ),
                )),
              ),
            ),
            Divider(
              height: 1,
            ),
            ExpansionTile(
              title: Text("Order Items"),
              children: [
                ...reviewCartProvider.getReviewCartDataList.map((e) {
                  return SingleOrderItem(
                    reviewCartModel: e,
                  );
                }).toList(),
              ],
            ),
            Divider(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Subtotal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "\$ $totalPrice",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Delivery Charges",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "\$ $shippingCharges",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Discount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "-   \$ $discountValue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
