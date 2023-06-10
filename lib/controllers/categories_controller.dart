import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/View/homepage.dart';
// import 'package:velocity_x/velocity_x.dart';

import '../Const/firebase_consts.dart';

class CategoriesController extends GetxController {
  RxList<listOfProducts> products = <listOfProducts>[].obs;
  var categories = "".obs;
  var subCategories = "".obs;
  RxBool isLoading = false.obs;
  void fetchProducts() async {
    try {
      isLoading.value = true;
      //fetching documents/products
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("mainCategories")
          .doc(categories.value)
          .collection(subCategories.value)
          .get();

      print("done");
      // print("${querySnapshot.docs}");
      //parsing data of each product and returning to list
      List<listOfProducts> fetchedProducts = querySnapshot.docs
          .map((doc) {
            return  listOfProducts.fromMap(doc.data() as Map<String, dynamic>);})
          .toList();
      products.value = fetchedProducts;
      print(fetchedProducts[0].name);
      isLoading.value = false;
      update();
      // print("name: ${products[0].name} ");
    } on FirebaseException catch (e) {
      print("************** ${e.code} ${e.message}");
    }
  }
  selectCaregories(val) {
    categories.value = val;
    update();
  }

  selectsubCaregories(val) {
    subCategories.value = val;
    update();
  }
}

class listOfProducts {
  final String name;
  var price;
  var description;
  var productImageUrl;

  listOfProducts(
      {required this.name,
      required this.price,
      required this.description,
      required this.productImageUrl});
  factory listOfProducts.fromMap(Map<String, dynamic> map) {
    return listOfProducts(
      name: map['name'],
      price: map['price'],
      description: map['description'],
      productImageUrl: map['imageUrl'],
    );
  }
}
