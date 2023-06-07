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
  
  TextEditingController descriptionController = TextEditingController();

  var image_path = "".obs;
  var category = "".obs;
  var subCategory = "".obs;

  selectCategory(val) {
    category.value = val; 
    update();
    

  }

  selectsubCategory(val){
    subCategory.value = val; 
    update();
    print ("ITS RUNNING");
    
  }

  updateImagePath(val){
    image_path.value = val;
    update();
  }
  addProduct() async {
    
  
  try {
        CollectionReference categoryCollection =
          firestore.collection("mainCategories");
    categoryCollection.doc(category.value).collection(subCategory.value).add({
      'name': nameController.text,
      'price': priceController.text,
      'description': descriptionController.text,
      'imageUrl': image_path.value,
      // 'imageURL' : imageController.imageURL;
  });  
  print("${category.value}");
  print("${subCategory.value}");
  print("done");
      // Get.snackbar("Success","Prodcut added successfully",borderColor: Colors.tealAccent);
  } on FirebaseException catch (e) {
        print("************** ${e.code} ${e.message}");
      // Get.snackbar("Erro","Something went wrong", borderColor: Colors.red);
  }
   
    }

}
