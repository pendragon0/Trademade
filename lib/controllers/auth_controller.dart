import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/View/homepage.dart';
// import 'package:velocity_x/velocity_x.dart';

import '../Const/firebase_consts.dart';

class AuthController extends GetxController {
  var signupHide = true.obs; 
  var signinHide = true.obs; 
  signUpHide(){
    signupHide.value = !signupHide.value;
    update();
  }
   signInHide(){
    signinHide.value = !signinHide.value;
    update();

  }

   loginMethod({email, password}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {

      print("${e.message}");
      Get.snackbar("Error", "Credentials are incorrect");
    }
  }

  // Future<UserCredential?> 
  signUpMethod({email, password, name}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);      
      userCredential.user?.updateDisplayName(name.trim());
      userCredential.user?.updateEmail(email.trim());
      userCredential.user?.updatePhotoURL(
          "https://t3.ftcdn.net/jpg/05/79/55/26/360_F_579552668_sZD51Sjmi89GhGqyF27pZcrqyi7cEYBH.jpg");
      Get.offAll(HomePage());

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "Credentials are invalid");

    }
  }

  // storeUserData({name, password, email}) async {
  //     DocumentReference store =
  //         firestore.collection(usersCollection).doc(currentUser!.uid);

  //     store.set({
  //       'name': name,
  //       'password': password,
  //       'email': email,
  //     });
  //   }

    // signOutMethod(context) async {
    //   try {
    //     await auth.signOut();
    //   } catch (e) {
    //     // VxToast.show(context, msg: e.toString());
    //   }
    // }
}
