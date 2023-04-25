import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/%20check_out/payment_summary/single_order_item.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Payment Summary"),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          '\$ 100',
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text('Place Order'),
            onPressed: () {},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: ListTile(
                title: Center(
                  child: Text(
                    "Siddhant Waghanna",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Address Address Address Address",
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
                SingleOrderItem(),
                SingleOrderItem(),
                SingleOrderItem(),
                SingleOrderItem(),
                SingleOrderItem(),
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
                "\$ 150",
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
                "\$ 10",
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
                "-   \$ 10",
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
