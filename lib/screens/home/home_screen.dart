import 'dart:math';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/search/search.dart';

import '../../config/colors.dart';
import 'single_product.dart';

import 'package:flutter/material.dart';
import 'package:food_app/screens/home/product_overview/product_overview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  BuildContext? get context => null;

  Widget _buildFreshProduct() {
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
            children: [
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHerbsProduct() {
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
            children: [
              SingleProduct(
                productName: 'Fresh pudina',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://www.eatrightbasket.com/wp-content/uploads/2019/02/SS_Veg_28.jpg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCakesProduct() {
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
            children: [
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
              SingleProduct(
                productName: 'Fresh mint',
                productImage:
                    'https://c.ndtvimg.com/2019-11/hdmci5_starbucks_625x300_05_November_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      'https://lh3.googleusercontent.com/wCLuZ-gQpzDwItt66qB_fyE93GbmoTNyGNggP_XekjCmuPxxtbC5GsjQ5L5smqgdhFG_4qnOFHruU8nPG2ygbIzTFaTlTwpldA2gEXn3nmUS4nn6HgL8K7r_ui7mzy8JRxZy6zVWAcfEeuI7ZiC4cm0qJQy3FZwMM6i4TRSJG2p3HONTRgMTsESSZJfWHYmeQ-YjJsUbHegerg65A2PWJtpfDE73tn-odA_VJdQyyWoY0ldI6C3oL7BcpO1dSG-6ocOEosVEYeXnXaG2Lqht2rPYetvDVx00e1XJO7uyYfR81P58MRhCkCVYDzZX-JShKkC3eMLm3_Ua2cA-x7UOWgIc2tAQr14Asx7OD4icJEe3Wbs9t4ekmYQHZrdEG-wNSrA0SBaEsRevPyEcLg16magWTXrrGGUni9rqwTIks87fdeBWh3VMJncbIwa9U2gmLaVWQjAf46-wT4N6DwZro2wic_qhO1HuNS0aeTdAmnEoR4z3DGD5vRaULBrHuexOr01jOTO7AcqBX6-ojrw1gEVN-IwYOstlepeclhp8m1u43ZYMToFv1ntxUtajXKFu7rJgVH8LYAOBea1fTm3FKZzadOKoIqEkiIGEaCncaWYKRTLvjfIeB0aTa0eheNP1zMrfkAZY5jGKPV57-Pvi_aE9COGE5o7C14Q4KtnWjM3zMu-xt4ttzfFEMmm422jUMfINk6lrrXO2qFw8QDmmDuOl03lJKHe6t9qnDOWVJKkxAVUerjks3lg-OiczHfb0F356NVRbA67JnhHLUP7NE71crQZTKu8Qli-te2Xg2aLEHH21DInvrlgqJjO5EvF34Bvmk9UvkJ62fYW39bbmnUL3l7xJTWHS8854tr4538MZoINpW4GvZM-8L7ZWWS0Z2n-3o2re3Ba9IgqBrJAz6cO9zYew5c5trXJD=w1244-h933-s-no?authuser=0'),
                ),
              ),
              height: 150,
              // width: 500,
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
                              color: Colors.green[100],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: Text(
                              'On all vegetable products',
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
            _buildFreshProduct(),
            _buildHerbsProduct(),
            _buildCakesProduct(),
          ],
        ),
      ),
    );
  }
}
