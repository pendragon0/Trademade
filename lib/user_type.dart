
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/Const/colors.dart';

import 'package:trademade/view_retailers/signin.dart';
import 'package:trademade/view_wholesalers/signin_wholesaler.dart';

class userType extends StatefulWidget {
  userType({super.key});

  @override
  State<userType> createState() => _SignInPageState();
}

class _SignInPageState extends State<userType> {
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
                    'Would you like to sell Or Would you like to buy?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 32, 32),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
          
                  Container(
                      child: Row(
                    children: [

                      //Whole Saler Page Button
                      ElevatedButton(
                        onPressed: () {
                          Get.offAll(SignInPageWholeSaler());
                        },
                        child: Text(
                          "Sign in as a Whole Saler",
                          style: TextStyle(color: black, fontSize: 12.0),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF00695C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      SizedBox( width: 8,),

                      //Retailer Page button
                      ElevatedButton(
                        onPressed: () {
                          Get.offAll(SignInPage());
                        },
                        child: Text(
                          "Sign in as a Retailer",
                          style: TextStyle(color: black, fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF00695C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ],
                  )),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
