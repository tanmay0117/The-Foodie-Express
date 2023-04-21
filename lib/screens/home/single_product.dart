import 'package:flutter/material.dart';
import '../widgets/count.dart';
import 'product_overview/product_overview.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final Function onTap;
  const SingleProduct(
      {required this.productImage,
      required this.productName,
      required this.onTap,
      required this.productPrice,
      required this.productId});

  @override
  Widget build(BuildContext context) {
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
                      productImage: productImage,
                      productName: productName,
                      productPrice: productPrice,
                    ),
                  ),
                );
              },
              child: Image.network(productImage),
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
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '$productPrice\$/500 Gram',
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
                          child: Container(
                            height: 28,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              // color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                    ),
                                    child: Text(
                                      '50 Gram',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Count(
                        productId: productId,
                        productImage: productImage,
                        productName: productName,
                        productPrice: productPrice,
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
