import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/delivery_address.dart';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:food_app/screens/%20check_out/add_new_address/add_new_address.dart';
import 'package:food_app/screens/%20check_out/delivery_details/single_address.dart';
import 'package:food_app/screens/%20check_out/payment_summary/payment_summary.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  late DeliveryAddressModel value;

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.fetchDeliveryAddressData();
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
            deliveryAddressProvider.getDeliveryAddressDataList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        dam: widget.value,
                      ),
                    ),
                  );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            deliveryAddressProvider.getDeliveryAddressDataList.isEmpty
                ? "Add new address"
                : "Payment Summary",
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
          deliveryAddressProvider.getDeliveryAddressDataList.isEmpty
              ? Container(
                  child: Center(child: Text("No Address")),
                )
              : Column(
                  children: [
                    ...deliveryAddressProvider.getDeliveryAddressDataList
                        .map((e) {
                      setState(() {
                        widget.value = e;
                      });
                      return SingleAddress(
                        address:
                            "${e.flatNo}, ${e.building}, ${e.society}, ${e.area}, ${e.pincode},",
                        name: "${e.firstName} ${e.lastName}",
                        number: e.mobileNo,
                        addressType: e.addressType == "AddressType.Other"
                            ? "Other"
                            : e.addressType == "AddressType.Home"
                                ? "Home"
                                : "Work",
                      );
                    }).toList(),
                  ],
                )
        ],
      ),
      //
      // ),
    );
  }
}
