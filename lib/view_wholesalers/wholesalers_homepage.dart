// ignore_for_file: unused_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademade/user_type.dart';
import 'package:trademade/view_retailers/add_product_page.dart';
import 'package:trademade/view_wholesalers/upload_products.dart';

import '../controllers/auth_controller.dart';
import '../view_retailers/how_it_works.dart';
import '../view_retailers/who_are_we.dart';

class homepageWholesaler extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white))),
      home: Scaffold(
        appBar: AppBar(
          leading: Transform.scale(
            scale: 1.5, // Adjust the scale as per your need
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'assets/images/trademade_logo.png'), // add your logo asset here
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'assets/images/avatar_basic.png'), // add your user profile image link here
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFF0D5230),
                        Color(0xFF26A69A), // Lighter shade of the color
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Your total sales',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        const Text(
                          '123,456', // sample sales number
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0), // increased font size
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3, // Back to 3 columns
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 10.0, // Reduced spacing
                  crossAxisSpacing: 4.0,
                  children: <Widget>[
                    _buildTile(
                      context,
                      title: "Orders Shipping",
                      child: _buildNumberInSquare(
                          '99', const Color.fromARGB(255, 127, 211, 130)),
                      titleColor: Colors.white,
                    ),
                    _buildTile(
                      context,
                      title: "In-Transit Currently",
                      child: _buildNumberInSquare(
                          '80', const Color.fromARGB(255, 127, 211, 130)),
                      titleColor: Colors.white, // Title color changed to white
                    ),
                    _buildTile(context,
                        title: "Awaiting Stock Confirmation",
                        child: _buildNumberInSquare(
                          '21',
                          const Color.fromARGB(255, 221, 94, 85),
                        ),
                        titleColor: Colors.white),
                    _buildTile(context,
                        title: "Live Products",
                        child: const Icon(Icons.shopping_basket,
                            color: Color.fromARGB(255, 160, 235, 227),
                            size: 40), // Size increased
                        titleColor: Colors.white),
                    _buildTile(context,
                        title: "Out of Stock",
                        child: const Icon(Icons.cancel,
                            color: Color.fromARGB(255, 160, 235, 227),
                            size: 40), // Size increased
                        titleColor: Colors.white),
                    _buildTile(context,
                        title: "Help",
                        child: const Icon(Icons.help_outline,
                            color: Color.fromARGB(255, 160, 235, 227),
                            size: 40), // Size increased
                        titleColor: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildFrostedBottomBar(context),
        endDrawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF3C8589),
                ),
                child: Text(
                  ' ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('HOME'),
                onTap: () {
                  // Handle HOME button tap
                },
              ),
              ListTile(
                title: const Text('PROFILE'),
                onTap: () {
                  // Handle PROFILE button tap
                },
              ),
              ListTile(
                title: const Text('WHO ARE WE'),
                onTap: () {
                  Get.offAll(WhoWeArePage());
                },
              ),
              ListTile(
                title: const Text('HOW IT WORKS'),
                onTap: () {
                  Get.offAll(HowItWorks());
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  authController.signOutMethod();
                  if (authController.signedOut == true) {
                    Get.offAll(UserSelectionPage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required String title,
      required Widget child,
      Color titleColor = Colors.black}) {
    return Card(
      color: Colors.grey,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Padding(
          // Padding added for more spacing
          padding: const EdgeInsets.all(8.0), // Reduced padding to adjust size
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
              const SizedBox(height: 5.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0, color: titleColor), // Reduced font size
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberInSquare(String number, Color bgColor) {
    return Container(
      width: 40.0, // Reduced size
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0, // Reduced font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFrostedBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 70,
            color: const Color.fromARGB(255, 252, 253, 253).withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    Get.offAll(CategoryPage());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Get.offAll(homepageWholesaler());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
