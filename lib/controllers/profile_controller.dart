import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/View/homepage.dart';
// import 'package:velocity_x/velocity_x.dart';

import '../Const/firebase_consts.dart';

class ProfileController extends GetxController {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var category = "electronics".obs;
  var subategory = "laptops".obs;

  addProduct() async {
  try {
        CollectionReference categoryCollection =
          firestore.collection("mainCategories");
    categoryCollection.doc(category.value).collection(subategory.value).add({
      'name': nameController.text,
      'price': priceController.text,
  });  
  print("done");
      // Get.snackbar("Success","Prodcut added successfully",borderColor: Colors.tealAccent);
  } on FirebaseException catch (e) {
        print("************** ${e.code} ${e.message}");
      // Get.snackbar("Erro","Something went wrong", borderColor: Colors.red);
  }
    // store.set({
    //     'name': name,
    //     'password': password,
    //     'email': email,
    //   });
    }

}
