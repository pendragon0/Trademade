import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/product_model.dart';
import '../controllers/cartstate_controller.dart';
import 'bottom_app_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: Text(
                  'Cart is empty',
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        Product product = cartController.cartItems[index];

                        return Card(
                          elevation: 4,
                          child: ListTile(
                            leading: Image.network(product.imageUrl),
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("${product.price} pkr"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    // Decrease the quantity
                                    cartController.decreaseQuantity(product);
                                  },
                                ),
                                Text(
                                  '${product.quantity}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    // Increase the quantity
                                    cartController.increaseQuantity(product);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // Remove item from cart
                                    cartController.removeFromCart(product);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.teal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            'Total: ${cartController.calculateTotalPrice()} pkr',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Proceed to checkout
                            cartController.checkout();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text(
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
      ),
      bottomNavigationBar: const CustomBottomAppBar(currentIndex: 2),
    );
  }
}
