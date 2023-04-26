import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/screens/%20check_out/add_new_address/add_new_address.dart';
import 'package:location/location.dart';

import '../models/delivery_address.dart';

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
  late LocationData setLocation;

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
    } else if (setLocation.longitude == null) {
      Fluttertoast.showToast(msg: "Set your location");
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
        "latitude": setLocation.latitude,
        "longitude": setLocation.longitude,
      }).then((value) async {
        await Fluttertoast.showToast(msg: "Added Your Delivery address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressDataList = [];

  fetchDeliveryAddressData() async {
    late DeliveryAddressModel deliveryAddressModel;
    List<DeliveryAddressModel> newList = [];
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("firstName"),
        lastName: _db.get("lastName"),
        mobileNo: _db.get("mobileNo"),
        flatNo: _db.get("flatNo"),
        building: _db.get("building"),
        society: _db.get("society"),
        area: _db.get("area"),
        pincode: _db.get("pincode"),
        addressType: _db.get("addressType"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressDataList = newList;
    notifyListeners();
  }

  /*List<DeliveryAddressProvider> */ get getDeliveryAddressDataList {
    return deliveryAddressDataList;
  }
}
