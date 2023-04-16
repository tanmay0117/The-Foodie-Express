import 'dart:math';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/search/search.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import 'single_product.dart';

import 'package:flutter/material.dart';
import 'package:food_app/screens/home/product_overview/product_overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // BuildContext? get context => null;
  late ProductProvider productProvider;

  Widget _buildCakeProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cakes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getCakesProductDataList.map(
              (cakesProductData) {
                return SingleProduct(
                  productName: cakesProductData.productName,
                  productImage: cakesProductData.productImage,
                  productPrice: cakesProductData.productPrice,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: cakesProductData.productName,
                          productImage: cakesProductData.productImage,
                          productPrice: cakesProductData.productPrice,
                        ),
                      ) as Route<Object?>,
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBreadProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breads',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getBreadsProductDataList.map(
              (breadsProductData) {
                return SingleProduct(
                  productName: breadsProductData.productName,
                  productImage: breadsProductData.productImage,
                  productPrice: breadsProductData.productPrice,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: breadsProductData.productName,
                          productImage: breadsProductData.productImage,
                          productPrice: breadsProductData.productPrice,
                        ),
                      ) as Route<Object?>,
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBeverageProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Beverages',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'View All',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getBeveragesProductDataList.map(
              (beveragesProductData) {
                return SingleProduct(
                  productName: beveragesProductData.productName,
                  productImage: beveragesProductData.productImage,
                  productPrice: beveragesProductData.productPrice,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: beveragesProductData.productName,
                          productImage: beveragesProductData.productImage,
                          productPrice: beveragesProductData.productPrice,
                        ),
                      ) as Route<Object?>,
                    );
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchCakesProductData();
    productProvider.fetchBreadsProductData();
    productProvider.fetchBeveragesProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    // productProvider.fetchCakesProductData();
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffd6b738),
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 20,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 10,
            ),
            child: Icon(
              Icons.shop,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepOrange,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/004/925/284/original/luxury-3d-background-sales-offer-discount-grand-prize-for-marketing-product-vector.jpg'),
                ),
              ),
              height: 150,
              // width: 400,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 170),
                            child: Container(
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.green,
                                        offset: Offset(3, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '40% Off',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: Text(
                              'On all Cake Products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ), // Top photo containing our photo and vegi logo
            _buildCakeProduct(),
            _buildBreadProduct(),
            _buildBeverageProduct(),
          ],
        ),
      ),
    );
  }
}
