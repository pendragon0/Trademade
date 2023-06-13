import 'package:flutter/material.dart';

import './homepage.dart';
import 'add_product_page.dart';
import 'categories.dart';
import 'orderpage.dart';
import 'profile_page.dart';

class CustomBottomAppBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomAppBar({required this.currentIndex});

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  void _onTabSelected(int index) {
    if (widget.currentIndex != index) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => _getPageForIndex(index)),
      );
    }
  }

  Widget _getPageForIndex(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Categories();
      case 2:
        return Container();
      case 3:
        return OrderPage(appLogo: 'assets/images/EC_bgimage.png');
      case 4:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Color.fromARGB(255, 171, 0, 0),
      unselectedItemColor: Color.fromARGB(255, 8, 8, 8).withOpacity(0.6),
      currentIndex: widget.currentIndex,
      onTap: _onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
