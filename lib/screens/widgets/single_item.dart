import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class SingleItem extends StatelessWidget {
  // const SingleItem({Key? key}) : super(key: key);
  // ProductModel productModel;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  Function onDelete;
  // ReviewCartModel data;
  // Function? onDelete;
// int productQuantity;

  bool isBool = false;
  SingleItem(
      {required this.isBool,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productId,
      int? productQuantity,
      required this.onDelete});

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
                    child: Image.network(productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${productPrice}\$/500 gm',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(
                                right: 15,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '50 Grams',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text("50 Gram"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 32,
                        )
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text(
                                  'ADD',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                onDelete();
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
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                    Text(
                                      'ADD',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
