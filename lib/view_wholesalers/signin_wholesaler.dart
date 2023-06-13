import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trademade/controllers/auth_controller.dart';
import 'package:trademade/view_retailers/signup.dart';
import 'package:trademade/view_wholesalers/wholesalers_homepage.dart';

class SignInPageWholeSaler extends StatefulWidget {
   SignInPageWholeSaler({super.key});

  @override
  State<SignInPageWholeSaler> createState() => _SignInPageState();
}


class _SignInPageState extends State<SignInPageWholeSaler> {
 TextEditingController emailController = TextEditingController();
 TextEditingController passController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF009688), Color(0xFF00695C)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                      'Sign in yourself with credentials',
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),

                      //email text
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),

                          //password text
                          child: TextFormField(
                        controller: passController,

                            // obscureText:  isHide,
                            decoration:  InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: GestureDetector(
                                onTap: (){
                                  authController.signInHide();
                                },
                                child: Icon(
                                  authController.signinHide.value?
                                    Icons.visibility_off:Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,

                    //sign in button
                    child: ElevatedButton(
                      onPressed: () {
                     authController.loginMethod(email: emailController.text,password: passController.text);
                     if (authController.loggedIn = true){
                      Get.offAll(homepageWholesaler());
                     }
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
                        'Sign In',
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
                    Text("Don't have an account? "),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage(),),);
                    }, child: Text("Sign Up"))
                  ],)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
