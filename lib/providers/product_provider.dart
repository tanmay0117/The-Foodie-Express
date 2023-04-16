import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/products_model.dart';

class ProductProvider with ChangeNotifier {
  //ProductProvider provides us with all the product's data in the form of list
  late ProductModel productModel;

  // Fetch Data for Cakes
  List<ProductModel> cakeProductsList = [];
  fetchCakesProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("CakeProducts").get();

    value.docs.forEach(
      //this iterates through all the 'documents' of cake products
      (element) {
        productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
        );
        newList.add(productModel);
      },
    );

    cakeProductsList = newList;
    notifyListeners();
  } // gives all cake data in the form of a list. This is a <ProductModel> list which has array of all objects.

  List<ProductModel> get getCakesProductDataList {
    return cakeProductsList;
  }

  // Fetch Data for Breads
  List<ProductModel> breadProductsList = [];
  fetchBreadsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("BreadProducts").get();

    value.docs.forEach(
      (element) {
        productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
        );
        newList.add(productModel);
        // print(element);
      },
    );

    breadProductsList = newList;
    notifyListeners();
  }

  List<ProductModel> get getBreadsProductDataList {
    // print(breadProductsList);
    return breadProductsList;
  }

  // Fetch Data for Beverages
  List<ProductModel> beverageProductsList = [];
  fetchBeveragesProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("BeverageProducts").get();

    value.docs.forEach(
      (element) {
        productModel = ProductModel(
          productName: element.get("productName"),
          productImage: element.get("productImage"),
          productPrice: element.get("productPrice"),
        );
        newList.add(productModel);
      },
    );

    beverageProductsList = newList;
    notifyListeners();
  }

  List<ProductModel> get getBeveragesProductDataList {
    return beverageProductsList;
  }
}
