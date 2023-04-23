import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  // const Count({Key? key}) : super(key: key);

  String productName;
  String productImage;
  String productId;
  int productPrice;
  String unitData;

  Count(
      {required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productId,
      required this.unitData});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        isTrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    getAddAndQuantity();
    // print(widget.productId);
    return Expanded(
      child: Container(
        height: 28,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          // color: Colors.grey,
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (count > 0) {
                          count--;
                        }
                        // if (count == 0) {
                        //   count = 1;
                        //   isTrue = false;
                        // }
                      });
                      if (count > 0) {
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                          unitData: widget.unitData,
                          // isAdd: true,
                        );
                      } else if (count == 0) {
                        reviewCartProvider
                            .reviewCartDataDelete(widget.productId);
                        // count = 1;
                        // isTrue = false;
                        setState(() {
                          count = 1;
                          isTrue = false;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 10,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      color: Color(0xffd0b84c),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                        unitData: widget.unitData,
                        // isAdd: true,
                      );
                    },
                    child: Icon(
                      Icons.add,
                      size: 10,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      unitData: widget.unitData,
                      isAdd: true,
                    );
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
      ),
    );
  }
}
