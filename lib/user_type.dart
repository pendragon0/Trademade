import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/view_retailers/signin.dart';
import 'package:trademade/view_wholesalers/signin_wholesaler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserSelectionPage(),
      ),
    );
  }
}

class UserSelectionPage extends StatelessWidget {
  final double blurSize = 300.0; // Customize the size of the blur effect
  final double borderRadius =
      10.0; // Customize the radius of the rounded corners

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [Colors.teal, Color.fromARGB(255, 11, 48, 43)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Stack(
      children: [
        Image.network(
          'https://cdn.discordapp.com/attachments/878624961475002389/1118632145590693909/Untitled_design_-_2023-06-14T220509.822.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 15.0,
          left: 0,
          child: Image.network(
            'https://cdn.discordapp.com/attachments/878624961475002389/1118632453817507860/Untitled_design_2.png',
            width: 200.0,
            height: 100.0,
          ),
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    width: blurSize,
                    height: blurSize,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REGISTER AS A',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.offAll(SignInPageWholeSaler());
                      },
                      height: 50.0,
                      minWidth: 200.0,
                      textColor: Colors.white,
                      child: Text(
                        'WHOLESALER',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(SignInPage());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0.0,
                        minimumSize: Size(200.0, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'RESELLER',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
