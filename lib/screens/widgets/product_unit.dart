import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

import '../../models/products_model.dart';

class ProductUnit extends StatefulWidget {
  // final Function onTap;
  String title;
  // final ProductModel productUnit;
  ProductUnit({
    required this.title,
  });

  String getTitle() {
    return "Shetta";
  }

  @override
  State<ProductUnit> createState() => _ProductUnitState();
}

class _ProductUnitState extends State<ProductUnit> {
  // String title = "Quantity";
  @override
  Widget build(BuildContext context) {
    return Container(
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
                widget.title,
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
    );
  }
}
