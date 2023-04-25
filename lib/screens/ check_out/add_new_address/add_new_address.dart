import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/%20check_out/add_new_address/inputs.dart';
import 'package:provider/provider.dart';

import '../../../providers/checkout_provider.dart';

enum AddressTypes {
  Home,
  Work,
  Other,
}

class AddNewAddress extends StatefulWidget {
  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: MaterialButton(
          color: primaryColor,
          onPressed: () {
            checkoutProvider.validator(context, myType);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "Add Address",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            InputDetails(
              labText: "First Name",
              controller: checkoutProvider.firstName,
            ),
            InputDetails(
              labText: "Last Name",
              controller: checkoutProvider.lastName,
            ),
            InputDetails(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            InputDetails(
              labText: "Flat No/ Plot No",
              controller: checkoutProvider.flatNo,
            ),
            InputDetails(
              labText: "Building",
              controller: checkoutProvider.building,
            ),
            InputDetails(
              labText: "Society",
              controller: checkoutProvider.society,
            ),
            InputDetails(
              labText: "Area",
              controller: checkoutProvider.area,
            ),
            InputDetails(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Set Location")],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Address Type",
              ),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ), //Home
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ), //Work
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.other_houses,
                color: primaryColor,
              ),
            ), //Other
          ],
        ),
      ),
    );
  }
}
