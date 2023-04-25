import 'package:flutter/material.dart';

class SingleOrderItem extends StatelessWidget {
  const SingleOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
            "https://cdn.shopify.com/s/files/1/0512/9601/0440/products/Biscoffcheesecake.jpg?v=1617214325"),
        title: Text("Lotus Biscoff Cake"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "\$50",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              "Qty: 2",
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
