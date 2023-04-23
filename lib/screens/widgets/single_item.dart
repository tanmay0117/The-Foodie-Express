import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/widgets/count.dart';
import 'package:food_app/screens/widgets/product_unit.dart';

class SingleItem extends StatefulWidget {
  // const SingleItem({Key? key}) : super(key: key);
  // ProductModel productModel;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  List<dynamic> productUnit;
  Function onDelete;
  var unitData;
  // ReviewCartModel data;
  // Function? onDelete;
// int productQuantity;

  bool isBool = false;
  SingleItem({
    required this.isBool,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productId,
    int? productQuantity,
    required this.onDelete,
    required this.unitData,
    required this.productUnit,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.productPrice}\$/500 gm',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? Expanded(
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
                                              ...widget.productUnit
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
                                                          widget.unitData =
                                                              data;
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "ReviewCart")
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  ?.uid)
                                                              .collection(
                                                                  "YourReviewCart")
                                                              .doc(widget
                                                                  .productId)
                                                              .update({
                                                            "unitData":
                                                                widget.unitData
                                                          });
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
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
                                    title: widget.unitData,
                                    // productUnit: widget.productUnit,
                                  ),
                                ),
                              ),
                              flex: 1,
                            )
                          : Text(widget.unitData),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 32,
                        )
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          productImage: widget.productImage,
                          productId: widget.productId,
                          unitData: widget.unitData,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                widget.onDelete();
                              },
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Count(
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productImage: widget.productImage,
                              productId: widget.productId,
                              unitData: widget.unitData,
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
