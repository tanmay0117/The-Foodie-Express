import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/screens/%20check_out/add_new_address/add_new_address.dart';

class CheckoutProvider with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController flatNo = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  late AddressTypes myType;

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile No is empty");
    } else if (flatNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Flat No / Plot No is empty");
    } else if (building.text.isEmpty) {
      Fluttertoast.showToast(msg: "Building is empty");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "Society is empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode is empty");
    } else {
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobileNo": mobileNo.text,
        "flatNo": flatNo.text,
        "building": building.text,
        "society": society.text,
        "area": area.text,
        "pincode": pincode.text,
        "addressType": myType.toString(),
      }).then((value) async {
        await Fluttertoast.showToast(msg: "Added Your Delivery address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }
}
