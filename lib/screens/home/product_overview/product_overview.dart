import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/widgets/count.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../providers/review_cart_provider.dart';

enum SigningCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productID;
  var unitData;
  ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productID,
    required this.unitData,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigningCharacter _character = SigningCharacter.fill;

  int count = 1;
  bool isTrue = false;

  // late QuerySnapshot unitData;
  // getUnitData(ProductModel data) async {
  //   unitData = await FirebaseFirestore.instance
  //       .collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .collection("YourReviewCart")
  //       .doc(data.productId)
  //       .collection("unitData")
  //       .get();
  // }

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productID)
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

  Widget bottomNavigationBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    getAddAndQuantity();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: 'Add to WishList',
            iconData: Icons.favorite_outline,
          ),
          bottomNavigationBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: 'Go to Cart',
            iconData: Icons.shopping_cart_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Product Overview',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text('\$50'),
                  ),
                  Container(
                    height: 244,
                    padding: EdgeInsets.all(20),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      'Available Options',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigningCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = SigningCharacter.fill;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('\$${widget.productPrice}'),
                        Expanded(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (count > 0) {
                                              count--;
                                            }
                                          });
                                          if (count > 0) {
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartId: widget.productID,
                                                    cartName:
                                                        widget.productName,
                                                    cartImage:
                                                        widget.productImage,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count,
                                                    unitData: widget.unitData
                                                    // isAdd: true,
                                                    );
                                          } else if (count == 0) {
                                            reviewCartProvider
                                                .reviewCartDataDelete(
                                                    widget.productID);
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
                                          reviewCartProvider
                                              .updateReviewCartData(
                                                  cartId: widget.productID,
                                                  cartName: widget.productName,
                                                  cartImage:
                                                      widget.productImage,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count,
                                                  unitData: widget.unitData
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
                                        // reviewCartProvider.addReviewCartData(cartId: cartId, cartName: cartName, cartImage: cartImage, cartPrice: cartPrice, cartQuantity: cartQuantity)
                                        reviewCartProvider.addReviewCartData(
                                          cartId: widget.productID,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "In the case of a GestureDetector, this error can occur if the content inside the GestureDetector widget is too large and overflows beyond the boundaries of the parent widget or screen. This can happen if the GestureDetector widget is nested inside a widget that has a fixed height, such as a Container or a SizedBox.",
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
