import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/%20check_out/add_new_address/add_new_address.dart';
import 'package:food_app/screens/%20check_out/delivery_details/single_address.dart';
import 'package:food_app/screens/%20check_out/payment_summary/payment_summary.dart';

class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    SingleAddress(),
    SingleAddress(),
    SingleAddress(),
    SingleAddress(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Delivery Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNewAddress(),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: MaterialButton(
          color: primaryColor,
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(),
                    ),
                  );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            address.isEmpty ? "Add new address" : "Payment Summary",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image(
              image: AssetImage("lib/images/pngwing.com.png"),
            ),
            title: Text(
              "Choose Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 1,
          ),
          address.isEmpty
              ? Container(
                  child: Center(child: Text("No Address")),
                )
              : Column(
                  children: [
                    ...address,
                  ],
                )
        ],
      ),
      //
      // ),
    );
  }
}
