import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trademade/View/bottom_app_bar.dart';
import 'package:trademade/View/cart.dart';
import 'package:trademade/View/how_it_works.dart';
import 'package:trademade/View/lower_container.dart';
import 'package:trademade/View/upper_container.dart';
import 'package:trademade/View/who_are_we.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print("adnjanaj");
    // TODO: implement initState
    super.initState();
  
      var user = FirebaseAuth.instance.currentUser;

      setState(() {
        name = user?.displayName;
        email = user?.email;
        print("rafay $name");
        print("rafay $email");
      });
      
  }

  String? name = "";

  String? email = "";

  @override
  Widget build(BuildContext context) {
    print(name);
    print(email);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Upper Container
                Expanded(
                  flex: 3,
                  child: UpperContainer(),
                ),

                // Category buttons
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(
                        label: 'Fashion',
                        onTap: () {
                          // Handle Fashion category tap
                        },
                      ),
                      CategoryButton(
                        label: 'Electronic',
                        onTap: () {
                          // Handle Electronic category tap
                        },
                      ),
                      CategoryButton(
                        label: 'Cosmetic',
                        onTap: () {
                          // Handle Cosmetic category tap
                        },
                      ),
                    ],
                  ),
                ),

                // Lower Container
                Expanded(
                  flex: 2,
                  child: LowerContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 0),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle floating action button tap
      //   },
      //   child: Icon(Icons.add),
      // ),
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
              title: const Text('CATEGORIES'),
              onTap: () {
                // Handle CATEGORIES button tap
              },
            ),
            ListTile(
              title: const Text('CART'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cart()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WhoWeArePage()),
                );
              },
            ),
            ListTile(
              title: const Text('HOW IT WORKS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HowItWorks()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout button tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CategoryButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF3C8589),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
