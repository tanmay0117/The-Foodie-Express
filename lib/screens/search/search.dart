import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/widgets/single_item.dart';

import '../../models/products_model.dart';

class Search extends StatefulWidget {
  // const Search({Key? key}) : super(key: key);

  List<ProductModel> search;
  Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  String query = "";

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query
        .toLowerCase()); // here when query is null all the iterms are searched hence we used _searchItem on line no 83
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Search',
          style: TextStyle(
            color: textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu_rounded,
              color: textColor,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('Items'),
                ),
                Container(
                  height: 52,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color(0xffc2c2c2),
                      filled: true,
                      hintText: 'Search for items in the store',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: _searchItem.map((data) {
                    return SingleItem(
                      isBool: false,
                      productId: data.productId,
                      // productQuantity: data.productQuantity,
                      productImage: data.productImage,
                      productName: data.productName,
                      productPrice: data.productPrice,
                      onDelete: () {},
                    );
                  }).toList(),
                ),
              ],
            );
          }),
      // body: ListView(
      //   children: [
      //
      //   ],
      // ),
    );
  }
}
