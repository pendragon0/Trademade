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

  selectCaregories(val) {
    categories.value = val;
    update();
  }

  selectsubCaregories(val) {
    subCategories.value = val;
    update();
  }

  void fetchProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("mainCategories")
          .doc(categories.value)
          .collection(subCategories.value)
          .get();

      print("done");
      print("${querySnapshot.docs}");

      List<listOfProducts> fetchedProducts = querySnapshot.docs
          .map((doc) =>
              listOfProducts.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      // List<listOfProducts> fetchedProducts = querySnapshot.docs.map((doc) => print("${doc.data}")).toList();
      // querySnapshot.docs.forEach((element) {products.add(element);});
      products.value = fetchedProducts;
      // print ("$fetchedProducts");
    } on FirebaseException catch (e) {
      print("************** ${e.code} ${e.message}");
    }
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
      productImageUrl: map['ImageUrl'],
    );
  }
}
