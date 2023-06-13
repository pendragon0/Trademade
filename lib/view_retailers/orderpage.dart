import 'package:flutter/material.dart';
import './bottom_app_bar.dart';
import './homepage.dart';

class OrderPage extends StatefulWidget {
  final String appLogo;

  OrderPage({required this.appLogo});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isInProgressSelected = true;

  void _selectInProgress() {
    setState(() {
      isInProgressSelected = true;
    });
  }

  void _selectDelivered() {
    setState(() {
      isInProgressSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.white, Color.fromRGBO(14, 136, 131, 1)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(widget.appLogo, height: 80),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  'In Progress',
                  isInProgressSelected,
                  _selectInProgress,
                ),
                const SizedBox(width: 16),
                _buildButton(
                  'Delivered',
                  !isInProgressSelected,
                  _selectDelivered,
                ),
              ],
            ),
            Expanded(
              child: isInProgressSelected
                  ? OrderInProgressScreen()
                  : OrderDeliveredScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(currentIndex: 3),
    );
  }

  Widget _buildButton(String text, bool isSelected, VoidCallback onPressed) {
    Color buttonColor =
        isSelected ? const Color.fromRGBO(14, 131, 136, 1) : Colors.white;
    Color textColor =
        isSelected ? Colors.white : const Color.fromRGBO(14, 131, 136, 1);
    Color borderColor = isSelected ? Colors.blue : Colors.white;

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

class OrderInProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No orders placed yet',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle "explore products" button press
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Explore Products',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDeliveredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No delivered orders yet',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle "explore products" button press
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Explore Products',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderPage(
          appLogo: 'assets/images/EC.png'), // Replace with your app logo asset path
    );
  }
}
