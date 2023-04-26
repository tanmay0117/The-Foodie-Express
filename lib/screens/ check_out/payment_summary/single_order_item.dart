import 'package:flutter/material.dart';
import 'package:food_app/models/review_cart_model.dart';

class SingleOrderItem extends StatelessWidget {
  ReviewCartModel reviewCartModel;
  SingleOrderItem({
    required this.reviewCartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(reviewCartModel.cartImage),
        title: Text(reviewCartModel.cartName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                reviewCartModel.cartPrice.toString(),
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              "Qty: ${reviewCartModel.cartQuantity}",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
