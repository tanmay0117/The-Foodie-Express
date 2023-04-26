import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class SingleAddress extends StatelessWidget {
  String address;
  String name;
  String number;
  String addressType;
  SingleAddress({
    required this.address,
    required this.name,
    required this.number,
    required this.addressType,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              name,
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  number,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: Container(
              width: 60,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor,
              ),
              child: Center(
                child: Text(
                  addressType,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
