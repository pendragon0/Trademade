import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/user_type.dart';
import 'package:trademade/view_retailers/cart.dart';
import 'package:trademade/view_retailers/orderpage.dart';

import '../controllers/auth_controller.dart';

class RetailerProfilePage extends StatefulWidget {
  @override
  _RetailerProfilePageState createState() => _RetailerProfilePageState();
}

class _RetailerProfilePageState extends State<RetailerProfilePage> {
  bool isButtonPressed = false;
  AuthController authController = Get.put(AuthController());

  void highlightButton() {
    setState(() {
      isButtonPressed = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isButtonPressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/878624961475002389/1118263995405697095/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Retailer Profile',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 14, 118, 81),
                            Color.fromARGB(255, 66, 170, 137)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Sales:',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Divider(color: Colors.white),
                              SizedBox(height: 8.0),
                              Text(
                                'Completed Orders:',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Total Profit:',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Total Bonus:',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '100',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Divider(color: Colors.white),
                              SizedBox(height: 8.0),
                              Text(
                                '80',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$1500',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$500',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                        },
                        icon: Icon(Icons.business),
                        label: Text(
                          'Business Details',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                        },
                        icon: Icon(Icons.account_balance_wallet),
                        label: Text(
                          'My Profit',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                        },
                        icon: Icon(Icons.favorite),
                        label: Text(
                          'Favorites',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,

                      //cart button
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                          Get.offAll(CartPage());
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text(
                          'Your Cart',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,

                      //order button
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                          Get.offAll(OrderPage());
                        },
                        icon: Icon(Icons.receipt),
                        label: Text(
                          'Your Orders',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Divider(),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          highlightButton();
                          authController.signOutMethod();
                          if (authController.signedOut == true) {
                            Get.offAll(UserSelectionPage());
                          }
                        },
                        icon: Icon(Icons.exit_to_app),
                        label: Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 32.0)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
