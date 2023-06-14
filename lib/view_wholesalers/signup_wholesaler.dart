// ignore_for_file: unused_import, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/controllers/auth_controller.dart';
import 'package:trademade/view_retailers/signin.dart';
import 'package:trademade/view_wholesalers/signin_wholesaler.dart';
import 'package:trademade/view_wholesalers/wholesalers_homepage.dart';
// import 'package:velocity_x/velocity_x.dart';
import '../Const/firebase_consts.dart';

class SignUpPageWholeSaler extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  SignUpPageWholeSaler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF009688), Color(0xFF00695C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Opacity(
                opacity: 0.7,
                child: Text(
                  'Register yourself with a Email and Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.7),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),

                  //name field
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person_2,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.7),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),

                  //email field
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GetBuilder(
                  init: authController,
                  builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.7),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),

                        //password field
                        child: TextFormField(
                          controller: passController,
                          obscureText: authController.signupHide.value,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: GestureDetector(
                              onTap: () {
                                authController.signUpHide();
                              },
                              child: Icon(
                                authController.signupHide.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                height: 48.0,

                //sign up button
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      authController.signUpMethod(
                          email: emailController.text,
                          name: nameController.text,
                          password: passController.text);
                      if (authController.loggedIn = true) {
                        Get.offAll(homepageWholesaler());
                      }
                    } catch (e) {
                      auth.signOut();
                    }
                    ;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF00695C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    elevation: 4.0,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPageWholeSaler()));
                      },
                      child: const Text("Sign In"))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
