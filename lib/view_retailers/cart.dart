import 'package:flutter/material.dart';


class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Page',
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.teal,
        elevation: 0, // Remove the shadow from the app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                // Cart Items List
                Card(
                  elevation: 4, // Add a subtle shadow to the card
                  child: ListTile(
                    leading: Image.asset('assets/images/1.jpg'),
                    title: const Text(
                      'Berluti X',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Price: \$10.00'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remove item from cart
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/2.jpg'),
                    title: const Text(
                      'Berluti',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Price: \$15.00'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remove item from cart
                      },
                    ),
                  ),
                ),
                // Add more cart items as needed
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Price Calculation
                const Text(
                  'Total: \$25.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                // Checkout Button
                ElevatedButton(
                  onPressed: () {
                    // Proceed to checkout
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child:const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
