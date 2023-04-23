import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/products_model.dart';
import 'package:provider/provider.dart';
import '../widgets/count.dart';
import '../widgets/product_unit.dart';
import 'product_overview/product_overview.dart';
import 'package:food_app/providers/review_cart_provider.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  // final Function onTap;
  final ProductModel productUnit;
  const SingleProduct({
    required this.productImage,
    required this.productName,
    // required this.onTap,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String unitData = "Quantity";
  late String firstValue;
  @override
  Widget build(BuildContext context) {
    // ProductUnit productUnit = ProductUnit(productUnit: widget.productUnit);
    // ReviewCartProvider reviewCartProvider = Provider.of(context);
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return Container(
      //outerpart skeleton
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 228,
      width: 152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffd9dad9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductOverview(
                      productImage: widget.productImage,
                      productName: widget.productName,
                      productPrice: widget.productPrice,
                      productID: widget.productId,
                      unitData: unitData,
                    ),
                  ),
                );
              },
              child: Image.network(widget.productImage),
            ),
          ), //image here
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${widget.productPrice}\$/50 Gram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: GestureDetector(
                            onTap: () {
                              // print("FUCK");
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Wrap(
                                      children: [
                                        ...widget.productUnit.productUnit
                                            .map<Widget>((data) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                child: ListTile(
                                                  // leading: Icon(Icons.share),
                                                  title: Center(
                                                    child: Text(
                                                      data,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    unitData = data;
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "ReviewCart")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            ?.uid)
                                                        .collection(
                                                            "YourReviewCart")
                                                        .doc(widget.productId)
                                                        .update({
                                                      "unitData": unitData
                                                    });
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Divider(
                                                height: 1,
                                              ),
                                            ],
                                          );
                                        }),
                                      ],
                                    );
                                  });
                            },
                            child: ProductUnit(
                              title: unitData == "Quantity"
                                  ? firstValue
                                  : unitData,
                              // productUnit: widget.productUnit,
                            ),
                          ),
                        ),
                        flex: 2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Count(
                        productId: widget.productId,
                        productImage: widget.productImage,
                        productName: widget.productName,
                        productPrice: widget.productPrice,
                        unitData: unitData,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ), // dropdown + quantity scale
        ],
      ),
    );
  }
}

// // showModalBottomSheet(
// //     context: context,
// //     builder: (context) {
// //       return Wrap(
// //         children: [
// //           widget.productUnit.productUnit
// //               .map<String>((data) {
// //             return Wrap(
// //               children: [
// //                 ListTile(
// //                   // leading: Icon(Icons.share),
// //                   title: Center(
// //                     child: Text(
// //                       data,
// //                     ),
// //                   ),
// //                 ),
// //                 Divider(
// //                   height: 1,
// //                 ),
// //               ],
// //             );
// //           }).toList(),
// //         ],
// //       );
// //     });
// },
// title: '50 Gram',
// ),
